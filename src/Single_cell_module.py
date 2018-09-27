# -*- coding: utf-8 -*-
"""
Created on Mon Jan 29 11:29:01 2018

@author: mohammad
"""
import math as m
from c_2D_drawing_tools import *
from draw_primary_object import *
from bool_swp_op import *
from IO_txt_proc_module import text_process

#from extract_cell_parameters import *

class Make_cells:


    def Axis_partioning(self,tank_n, Cell_pos, DT_DTL_radi, GapArea, do_union):
        # This method create a small partition around axis which improves the calculated field accuracy
        cell_number = 0
        axis_InDT_list = []
        axis_Gap_list = []
        cavity_script = ''
        Axis_p_script = ''
        counter = 0

        total_cells = len(Cell_pos)
        if type(Cell_pos[counter]) == float:
            total_cells -= 1;

        for i in range(0, total_cells):
            cell_number += 1
            axis_InDT_name = 'InDT_axis_body' + str(int((tank_n * 1000) + cell_number))
            axis_Gap_name = 'InGaP_axis_body' + str(int((tank_n * 1000) + cell_number))
            if type(Cell_pos[counter]) != float:
                cell_offset = Cell_pos[counter][0]
                cell_len = Cell_pos[counter][1]
            else:
                cell_offset = Cell_pos[0]
                cell_len = Cell_pos[1]
            Axis_p_script = Axis_p_script + '' + self.drw_cyl(axis_InDT_name, 'vacuum', [cell_offset, 0, 0],
                                                         DT_DTL_radi[0] * 0.2,
                                                         cell_len, 'x', 'cm')
            Axis_p_script = Axis_p_script + '' + self.drw_cyl(axis_Gap_name, 'vacuum',
                                                         [cell_offset + 0.85 * (GapArea[0][0]), 0, 0],
                                                         DT_DTL_radi[0] * 0.8,
                                                         1.65 * (GapArea[0][1]), 'x', 'cm')
            axis_InDT_list.append(axis_InDT_name)
            axis_Gap_list.append(axis_Gap_name)
            counter += 1

        if len(Cell_pos) > 2:
            if do_union == True:
                KeepOriginals = 'False'
                Axis_p_script = '\n' + Axis_p_script + union_objects(axis_InDT_list, KeepOriginals) + '\n\n'
                Axis_p_script = '\n' + Axis_p_script + union_objects(axis_Gap_list, KeepOriginals) + '\n\n'
        Axis_p_script = '\n' + Axis_p_script + union_objects([axis_InDT_list[0], axis_Gap_list[0]],
                                                             KeepOriginals) + '\n\n'
        return (Axis_p_script, axis_Gap_list, axis_InDT_list)

    def Make_PCs(self,tank_n, PC_radi, DT_center, PC_h, DT_DTL_radi, do_union):
        # stem_number is (tank_n*1000)+stem sequence number in the tank
        # DT_center is a 1D list that holds drift tube centers
        # stem_radi is the stem radious in cm
        # use_stems: is a bool var that if it is true, stems will be build
        PC_n = 0
        PC_script = ''
        PC_list = []
        PC_direction = +1;  # A temporary variable that indicates the PC direction {-1,+1}
        for i in DT_center:
            PC_n += 1
            PC_name = 'PC_' + str(int((tank_n * 1000) + PC_n));
            # if use_PCs == True:
            PC_script = PC_script + self.drw_cyl(PC_name, 'vacuum', \
                                            [DT_center[PC_n - 1], PC_direction * DT_DTL_radi[2], 0.], 1.0,
                                            -1.0 * PC_direction * PC_h, 'y', 'cm') + '\n\n'
            PC_list.append(PC_name);
            PC_direction = PC_direction * -1;

        if (do_union == True) & (len(PC_list) > 1):
            KeepOriginals = 'False'
            PC_script = '\n\n' + PC_script + union_objects(PC_list, KeepOriginals) + '\n\n'
        return (PC_script, PC_list)

    def Make_stems(self,tank_n, stem_radi, DT_center, DT_DTL_radi, do_union):
        # stem_number is (tank_n*1000)+stem sequence number in the tank
        # DT_center is a 1D list that holds drift tube centers
        # stem_radi is the stem radious in cm
        # use_stems: is a bool var that if it is true, stems will be build
        Stem_n = 0
        stem_script = ''
        stem_list = []
        for i in DT_center:
            Stem_n += 1
            stem_name = 'stem_' + str(int((tank_n * 1000) + Stem_n))
            # if use_stems == True:
            stem_script = stem_script + self.drw_cyl(stem_name, 'vacuum', \
                                                [DT_center[Stem_n - 1], 0, DT_DTL_radi[1] - .2], 1.0,
                                                DT_DTL_radi[2] - DT_DTL_radi[1] + 0.2, 'z', 'cm') + '\n\n'
            stem_list.append(stem_name)
        if (do_union == True) & (len(stem_list) > 1):
            KeepOriginals = 'False'
            stem_script = '\n\n' + stem_script + union_objects(stem_list, KeepOriginals) + '\n\n'
        return (stem_script, stem_list)

    def Make_cavity_wall(self,tank_n, Cell_pos, DT_DTL_radi, do_union):
        # Create cavity !
        cell_number = 0
        cavity_list = []
        cavity_script = ''
        cavity_body = ''
        counter = 0

        total_cells = len(Cell_pos)
        if type(Cell_pos[counter]) == float:
            total_cells -= 1;

        for i in range(0, total_cells):
            cell_number += 1
            wall_name = 'Cavity_body' + str(int((tank_n * 1000) + cell_number))

            if type(Cell_pos[counter]) != float:
                cell_offset = Cell_pos[counter][0]
                cell_len = Cell_pos[counter][1]
            else:
                cell_offset = Cell_pos[0]
                cell_len = Cell_pos[1]
            cavity_body = cavity_body + '' + self.drw_cyl(wall_name, 'vacuum', [cell_offset, 0, 0], DT_DTL_radi[2], cell_len,
                                                     'x', 'cm')
            cavity_list.append(wall_name)
            counter += 1

        if len(Cell_pos) > 2:
            if do_union == True:
                KeepOriginals = 'False'
                cavity_body = '' + cavity_body + union_objects(cavity_list, KeepOriginals)
        return (cavity_body, cavity_list)

    def Single_cell_3d(self,str_inp, cell_number, cell_offset, right_dt_len, DT_DTL_radi):
        dt_r1 = DT_DTL_radi[0]
        dt_r2 = DT_DTL_radi[1]
        IO_text_process = text_process('')
        ss = IO_text_process.extract_cell_parameters_1(str_inp, dt_r1, dt_r2, cell_number, cell_offset)
        axis = 'x'
        rot_angle = 360

        drw_dt = Draw_2D(ss[0])
        drw_dt_l = drw_dt.draw_a_Half_cell()
        drw_dt = Draw_2D(ss[1])
        drw_dt_r = drw_dt.draw_a_Half_cell()

        # calculate DT's center position (center of drift tubes)
        DT_cent = -((right_dt_len - ss[0][0]) / 2.) + (cell_offset)

        GapArea = [ss[0][0], ss[1][12]]

        Cell_pos = [cell_offset, ss[1][11]]

        # print(right_dt_len,ss[0][0],DT_cent,cell_offset)
        # This variable stores the right side drift tube length temporarily
        right_dt_len = ss[1][0]

        dt_script = '\n\n\n' + drw_dt_r[1] + '\n\n' + drw_dt_l[1] + '\n\n'
        # rotate 2d dt plane and compelete 3d dt
        rot_dt_l_script = SweepAroundAx(drw_dt_l[0], axis, str(rot_angle))
        rot_dt_r_script = SweepAroundAx(drw_dt_r[0], axis, str(rot_angle))

        # script = dt_script + '\n' + rot_dt_l_script + '\n' + rot_dt_r_script + '\n' + union_dt_parts + '\n\n'
        # calculate drift tube center

        script = dt_script + '\n' + rot_dt_l_script + '\n' + rot_dt_r_script + '\n' + '\n\n'

        dt_len = right_dt_len

        return (script, dt_len, DT_cent, Cell_pos, GapArea)

    def drw_cyl(self,object_name, material_name, center, radi, height, axis, unit):
        drw_cyl_code = 'oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "' + str(
            center[0]) + unit + '", "YCenter:=",  _\n'
        drw_cyl_code = drw_cyl_code + '"' + str(center[1]) + unit + '", "ZCenter:=", "' + str(
            center[2]) + unit + '", "Radius:=", "' + str(radi) + unit + '", "Height:=",  _\n'
        drw_cyl_code = drw_cyl_code + '"' + str(
            height) + unit + '", "WhichAxis:=", "' + axis + '", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _\n'
        drw_cyl_code = drw_cyl_code + '"' + object_name + '", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _\n'
        drw_cyl_code = drw_cyl_code + '"Global", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "' + material_name + '" & Chr(34) & "", "SolveInside:=",  _\n'
        drw_cyl_code = drw_cyl_code + 'true)\n\n'
        return (drw_cyl_code)



