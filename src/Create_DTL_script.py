from IO_txt_proc_module import *
from Single_cell_module import *
from ConstsANDparam import *

def exec_pydtl(add):
    # Variables
    DT_DTL_radi     = [0.0] * 3 
    cell_n          = 1.0 
    cell_offset     = int() 
    right_dt_len    = int()
    # A list for the center of drift tube. The usual horizental location of stems
    GapArea         =list()   # 
    DT_name_list    =list() # this list fills with the names of Drift tubes
    dt_list         =list()
    axis_script     = ''
    InGapAxis       = list()
    Stem_script     = str()

    file_name = add
    IO_p = text_process(file_name) 
    CellScriptGen = Make_cells()# to create script for generating cells in HFSS
    outscript = '' 
    # Stores the extracted data containg the info for drawing of tank and \
    # dirft tubes
    (ExtData_tank,ExtData_DT,postcoupler_data,tuner_data) = IO_p.IO_read()  
    tank_n = int(ExtData_tank['tank_n']) 
    # extract the post-coupler and stem setting    
    use_stems = True if (ExtData_tank['add_stems']=='yes') else False
    use_PCs = True if (ExtData_tank['add_posts']=='yes') else False 

    #pc_radi    = ExtData_tank['post_radius'] 
    #stem_radii = ExtData_tank['stem_radius'] 

    # variable that stores bore, drift tube and tank radius.  
    DT_DTL_radi = [ExtData_tank['bore_diameter']/2, \
                         ExtData_tank['dt_diameter']/2, \
                         ExtData_tank['tank_diameter']/2  ]
    cell_script = ['']*len(ExtData_DT) 
    #C_wall_script= []*len(ExtData_DT) 
    
    # iteration over all cells and generate vb script for each one
    MakeCell = Make_cells()
    for i in range(0,len(ExtData_DT)):
        DT_n = (tank_n * 1000) + cell_n   # this var hold drift tube number
        # A temporary variable to hold converted cell parameters (converted to float)        
        cell_script[i]  = MakeCell.Single_cell_3d(ExtData_tank, ExtData_DT[i],\
                   cell_offset, DT_DTL_radi, right_dt_len,cell_n)
        # This part of loop stores information about cell location and drift 
        # tube centers.
        GapArea.append(cell_script[i][4])
        axis_script+= MakeCell.Axis_partioning(DT_DTL_radi, cell_offset, \
                                    GapArea[i],'axis_part_name'+str(100+i) )
        cell_offset += ExtData_DT[i]['Length']#float(Cell_DATA[11]) 
        right_dt_len = cell_script[i][1] 
        cell_n += 1 
        dt_list.append('DT_h_r'+str(i))
        dt_list.append('DT_h_l'+str(i))
        InGapAxis.append('axis_part_name'+str(100+i))
    
    # union all Drift tubes and make only one object
    unit_DT_script = '\n\n' + union_objects(dt_list,'False') + '\n\n'
    DT_Center_loc,DT_length,cell_length = MakeCell.Calc_DT_center(\
                                                       ExtData_tank,ExtData_DT)   
    
    DTL_cyl_wall =MakeCell.Make_cavity_wall(ExtData_tank,sum(cell_length))

    #if (len(DTL_DATA[2])==1) & (PC_stem_4walls == True):
    #    DT_center = DT_center[0:len(DT_center)-1] 
    do_union = True 
    if ExtData_tank['add_stems']=='yes':
        Stem_script = CellScriptGen.Make_stems(ExtData_tank,ExtData_DT,\
                        DT_Center_loc,ExtData_tank['stems_walls']=='yes', True) 
    if ExtData_tank['add_posts']=='yes':    
        post_script = CellScriptGen.post_coupler_script(ExtData_tank,\
                                    postcoupler_data,DT_Center_loc,do_union)
    tuner_script_vbs = CellScriptGen.tuner_script(ExtData_tank,tuner_data,\
                                                  do_union)

    for i in range(0,len(cell_script)):
        outscript += cell_script[i][0] 
        DT_n = i+1 
        DT_name_list.extend(['DT_h_l' + str(int(DT_n)), 'DT_h_r' + str(int(DT_n))]) 
    # Generate a script to create an extra partion around the axis: this option improve the accuracy of calculated field
    # while execution time is still fast.
    #axis_script = CellScriptGen.Axis_partioning(tank_n, Cell_pos, DT_DTL_radi,GapArea, do_union)
    #outscript += '\n\n'+ union_objects(DT_name_list,'False')+'\n\n' 
    # subtract metallic elements from cavity body (Drift tube, tuner, Post-couplers and stems)


    tool_list = ['DT_h_r0']
    if len(Stem_script)>3:  tool_list.append('stem_number_100')
    if len(post_script)>3:  tool_list.append('post_coupler_number_100')
    if len(tuner_script_vbs)>3:  tool_list.append('tuner_number_100')
    subtract_metallic_parts = subtract_objects(['cylindrical_wall'],tool_list, \
                                               'False')
    axis_script += '\n\n'+ union_objects(InGapAxis,'False') +'\n\n'
    axis_script += subtract_objects(['cylindrical_wall'],[InGapAxis[0]]\
                                                , 'True')+'\n\n'

    start_freq = 300 
    ConvergeOnRealFreq = 'true'
    NumModes = 1
    MaximumPasses = 8
    MaxDeltaFreq = 1e-5 

    SetUpAnalysisScript = SetUpAnalysis(start_freq, ConvergeOnRealFreq, NumModes, MaximumPasses, MaxDeltaFreq)
    InitMeshSetScript = str(InitMeshSetting('true'))
    return(header()+'\n'+outscript+'\n\n'+unit_DT_script+'\n'+InitMeshSetScript+'\n'+\
           '\n'+SetUpAnalysisScript+'\n'+'\n'+DTL_cyl_wall+'\n\n'+Stem_script+\
           '\n\n'+post_script+'\n\n'+tuner_script_vbs+'\n\n'+subtract_metallic_parts+\
           '\n\n'+axis_script+'\n\n')
 