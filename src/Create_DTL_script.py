import math as mt
from IO_txt_proc_module import *
from Single_cell_module import *
from extract_cell_parameters import *
from ConstsANDparam import *
from IO_txt_proc_module import *

def exec_pydtl(add):
    # Variables
    DT_DTL_radi = [0.0] * 3;
    cell_n = 1.0;
    cell_offset = 0.0;
    right_dt_len = 0.0;
    DT_center = [];
    Cell_pos = [];  # this is a 2D list that holds cell location and length
    GapArea = [];
    DT_name_list = [];
    PC_stem_4walls = False;
    PC_h = 1.5;

    file_name = add
    IO_p = text_process(file_name)
    CellScriptGen = Make_cells()# to create script for generating cells in HFSS
    outscript = '';
    def cell_DT(DT_data,cell_n, cell_offset, DT_DTL_radi,right_dt_len):
        script = CellScriptGen.Single_cell_3d(DT_data, cell_n, cell_offset, right_dt_len, DT_DTL_radi);
        return(script)

    txtIn = str(IO_p.IO_read())

    DTL_DATA = IO_p.extract_Tank_parameters(txtIn)


    tank_n = int(DTL_DATA[3][0]);

    # extract the post-coupler and stem setting
    use_stems = True;
    use_PCs = True;
    if DTL_DATA[3][2].lower()=='yes':
        use_PCs = True;
    elif DTL_DATA[3][2].lower()=='no':
        use_PCs = False;
    tank_n = int(DTL_DATA[3][0]);
    if DTL_DATA[3][1].lower() == 'yes':
        use_stems = True;
    elif DTL_DATA[3][1].lower() == 'no':
        use_stems = False;

    PC_radi    = DTL_DATA[1][1];
    stem_radii = DTL_DATA[1][0];

    # extract bore, drift tube and tank diameter.
    DT_DTL_radi[0] = float(DTL_DATA[0][0])#Bore radii
    DT_DTL_radi[1] = float(DTL_DATA[0][1])/2.#DT radii
    DT_DTL_radi[2] = float(DTL_DATA[0][2])/2.#Tank radii

    cell_script = ['']*len(DTL_DATA[2]);
    C_wall_script= []*len(DTL_DATA[2]);

    # iteration over all cells and generate vb script for each one
    for i in range(0,len(DTL_DATA[2])):
        DT_n = (tank_n * 1000) + cell_n;  # this var hold drift tube number
        Cell_DATA = DTL_DATA[2][i].split();# A temporary variable to hold converted cell parameters (converted to float)
        Cell_DATA = Cell_DATA
        Cell_DATA[len(Cell_DATA)-1] = Cell_DATA[len(Cell_DATA)-1].strip('\\r\\n')
        Cell_DATA = [float(k) for k in Cell_DATA];
        cell_script[i] = cell_DT(DTL_DATA[2][i], cell_n, cell_offset, DT_DTL_radi, right_dt_len);

        # This part of loop stores information about cell location and drift tube centers.
        GapArea.append(cell_script[i][4])
        if int(len(DTL_DATA[2])) != 1:
            DT_center.append(cell_script[i][2]);
            Cell_pos.append(cell_script[i][3]);
        else:
            DT_center = [0., cell_script[0][3][1]];
            Cell_pos = [0., cell_script[0][3][1]];

        cell_offset += float(Cell_DATA[11]);
        right_dt_len = cell_script[i][1];
        cell_n += 1;

    # draw Post-coupler at end walls if user sets "PC_stem_4walls == True"
    if PC_stem_4walls == True:
        DT_center[0] = 0;
        DT_center.append(cell_offset);
    else:
        if len(DTL_DATA[2])!=1:
            DT_center = DT_center[1:len(DT_center)];
        else:
            DT_center = [];

    if (len(DTL_DATA[2])==1) & (PC_stem_4walls == True):
        DT_center = DT_center[0:len(DT_center)-1];
    do_union = True;

    if use_stems:
        Stem_script = CellScriptGen.Make_stems(tank_n, stem_radii, DT_center, DT_DTL_radi, do_union);

    if use_PCs:
        PCs_script = CellScriptGen.Make_PCs(tank_n, PC_radi, DT_center, PC_h, DT_DTL_radi, do_union);

    # create cylindrical walls of tank for all cells
        C_wall_script = CellScriptGen.Make_cavity_wall(tank_n, Cell_pos, DT_DTL_radi, do_union);

    for i in range(0,len(cell_script)):
        outscript += cell_script[i][0];
        DT_n = i+1;
        DT_name_list.extend(['DT_h_l' + str(int(DT_n)), 'DT_h_r' + str(int(DT_n))]);
    # Generate a script to create an extra partion around the axis: this option improve the accuracy of calculated field
    # while execution time is still fast.
    axis_script = CellScriptGen.Axis_partioning(tank_n, Cell_pos, DT_DTL_radi,GapArea, do_union)
    # union all Drift tubes and make only one object
    outscript += '\n\n'+ union_objects(DT_name_list,'False')+'\n\n';
    # subtract metallic elements from cavity body (Drift tube, tuner, Post-couplers and stems)

    object_list=[]
    object_list.append(str(C_wall_script[1][0]))
    tool_list = []
    tool_list.append(str(PCs_script[1][0]))
    tool_list.append(str(DT_name_list[0]))
    tool_list.append(str(Stem_script[1][0]))
    subtract_metallic_parts = subtract_objects(object_list,tool_list, 'False')


    outscript += Stem_script[0];
    outscript += C_wall_script[0];
    outscript += PCs_script[0];
    outscript += axis_script[0];
    outscript += subtract_metallic_parts;


    start_freq = 300;
    ConvergeOnRealFreq = 'true'
    NumModes = 1
    MaximumPasses = 8
    MaxDeltaFreq = 1e-5;

    SetUpAnalysisScript = SetUpAnalysis(start_freq, ConvergeOnRealFreq, NumModes, MaximumPasses, MaxDeltaFreq)
    InitMeshSetScript = str(InitMeshSetting('true'))
    return(header()+'\n'+outscript+'\n'+'\n'+InitMeshSetScript+'\n'+'\n'+SetUpAnalysisScript)
    #return ( ''+ outscript + '' + '')
