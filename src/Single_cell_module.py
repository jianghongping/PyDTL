# -*- coding: utf-8 -*-
"""
Created on Mon Jan 29 11:29:01 2018

@author: mohammad
"""

from c_2D_drawing_tools import *
from bool_swp_op import *
from IO_txt_proc_module import text_process

#from extract_cell_parameters import *

class Make_cells:


    def Axis_partioning(self,DT_DTL_radi, cell_offset, GapArea,part_name):
        # This method create a small partition around axis which improves the
        # calculated field accuracy        
        Axis_p_script = str()                
        Axis_p_script = '\n\n' + self.drw_cyl(part_name, 'vacuum',
                        [cell_offset + (0.85 * (GapArea[0])), 0, 0],
                        DT_DTL_radi[0] * 0.4,
                        1.65 * (GapArea[1]), 'x', 'cm','Global')+'\n\n'  
        return(Axis_p_script)

    def post_coupler_script(self,TankParam,pc_locAndHight,DT_Center_loc,do_union):
        post_name_list = list()
        post_script    = str()
        count          = int()
        alterAzAng     = -1
        for post_l,post_h in pc_locAndHight:
            post_name = 'post_coupler_number_'+str(100+count)                         
            post_script += self.drw_cyl(post_name, 'vacuum', \
                [DT_Center_loc[post_l], alterAzAng * TankParam['tank_diameter']/2., 0.], \
                TankParam['post_radius'], -1.0 * alterAzAng * post_h, \
                'y', 'cm','Global') + '\n\n'
            count +=1
            alterAzAng *= -1                                         
            post_name_list.append(post_name)
        if do_union:
            post_script = '\n\n' + post_script + union_objects(post_name_list,\
                                                              'False') + '\n\n'                                    
        return(post_script)    
        
    def tuner_script(self,TankParam,tuner_data,do_union):
        tuner_name_list = list()
        tuner_script    = str()
        count          = int()
        
        for tuner_l,tuner_h,tuner_a in tuner_data:
            tuner_name = 'tuner_number_'+str(100+count)  
            CS_name    = 'RelCS4tuner_'+str(100+count)
            tuner_script += rotate_cordinateSystem(tuner_a,tuner_l,CS_name)                       
            tuner_script += self.drw_cyl(tuner_name, 'vacuum', \
                [TankParam['tank_diameter']/2., 0, 0], \
                TankParam['tuner_radius'] , -tuner_h, 'x', 'cm',CS_name) + '\n\n'
                                         
            tuner_script += workingCS('Global')                                         
            count +=1                                                 
            tuner_name_list.append(tuner_name)
        if do_union:
            tuner_script = '\n\n' + tuner_script + union_objects(tuner_name_list,\
                                                              'False') + '\n\n'                                    
        return(tuner_script)         
        
    def Make_stems(self,TankParam, cavity_length,DT_Center_loc,stem_sidewall,\
                   do_union):
        stem_name_list = list()
        stem_script    = str()
        count          = int()
        stem_hieght = (TankParam['tank_diameter'] - TankParam['dt_diameter'])/2 + 0.2
        if not stem_sidewall: DT_Center_loc = DT_Center_loc[1,-1]    
        for i in DT_Center_loc:
            stem_name = 'stem_number_'+str(100+count)             
            stem_script += self.drw_cyl(stem_name, 'vacuum', \
                                [i, 0, TankParam['dt_diameter']/2. - .2]\
                                , TankParam['stem_radius'], stem_hieght ,\
                                'z', 'cm','Global') + '\n\n'
            stem_name_list.append(stem_name)
            count +=1
        if do_union:
            stem_script = '\n\n' + stem_script + union_objects(stem_name_list,\
                                                               'False') + '\n\n'                                    
        return(stem_script)
    def Make_cavity_wall(self,TankParam, cavity_length):
        cavity_cyl_wall = str()
        cavity_cyl_wall = self.drw_cyl('cylindrical_wall', 'vacuum',[0, 0, 0], \
                                       0.5*TankParam['tank_diameter'], \
                                       cavity_length,'x', 'cm','Global')                    
        return(cavity_cyl_wall)
    def Calc_DT_center(self,TankParam, cell_prop):
        DT_length =list()
        DT_Center_loc = list()
        cell_length = [line['Length'] for line in cell_prop]
        #Add location for the case of having stem and pc on side wall
        DT_Center_loc.append(0.0)
        if len(cell_prop)>1:
            for i in range(0,len(cell_prop)-1):
                tmp  = cell_prop[i]
                tmpp1= cell_prop[i+1]
                #Create a list of Drift tube lengths
                tmp_DT_Len = tmp['Length']-tmp['GapCen']-(tmp['GapLen']/2)\
                                           +tmpp1['GapCen']-(tmpp1['GapLen']/2)  
                DT_length.append(tmp_DT_Len)
                #Calculates and list the location of Drift tubes center
                rel_DT_Center_loc = (tmp_DT_Len/2.)+(tmp['GapCen']+(tmp['GapLen']/2))
                DT_Center_loc.append(sum(cell_length[:i])+rel_DT_Center_loc)        
        #Add location of end side wall
        DT_Center_loc.append(sum(cell_length))        
        return(DT_Center_loc,DT_length,cell_length)                        
    def Single_cell_3d(self,TankParam, cell_prop, cell_offset, DT_DTL_radi, \
                       right_dt_len, cell_n):
        IO_text_process = text_process('')
        param_r,param_l = IO_text_process.cell_parameters_final_list(TankParam\
                               ,cell_prop,cell_offset)
        axis = 'x'
        rot_angle = 360
        drw_dt = Draw_2D(param_l)
        drw_dt_l = drw_dt.draw_a_Half_cell()
        drw_dt = Draw_2D(param_r)
        drw_dt_r = drw_dt.draw_a_Half_cell()
        # calculate DT's center position (center of drift tubes)
        DT_cent = -((right_dt_len - param_l[0]) / 2.) + (cell_offset)
        GapArea = [param_l[0], param_r[12]]
        Cell_pos = [cell_offset, param_r[11]]
        # print(right_dt_len,ss[0][0],DT_cent,cell_offset)
        # This variable stores the right side drift tube length temporarily
        right_dt_len = param_r[0]
        dt_script = '\n\n\n' + drw_dt_r[1] + '\n\n' + drw_dt_l[1] + '\n\n'
        # rotate 2d dt plane and compelete 3d dt
        rot_dt_l_script = SweepAroundAx(drw_dt_l[0], axis, str(rot_angle))
        rot_dt_r_script = SweepAroundAx(drw_dt_r[0], axis, str(rot_angle))
        # script = dt_script + '\n' + rot_dt_l_script + '\n' + rot_dt_r_script + '\n' + union_dt_parts + '\n\n'
        # calculate drift tube center
        script = dt_script + '\n' + rot_dt_l_script + '\n' + \
        rot_dt_r_script + '\n' + '\n\n'
        dt_len = right_dt_len
        return (script, dt_len, DT_cent, Cell_pos, GapArea)


    def drw_cyl(self,object_name, material_name, center, radi, height, axis, unit,CS):
        drw_cyl_code = 'oEditor.CreateCylinder Array("NAME:CylinderParameters", "XCenter:=", "' + str(
            center[0]) + unit + '", "YCenter:=",  _\n'
        drw_cyl_code = drw_cyl_code + '"' + str(center[1]) + unit + '", "ZCenter:=", "' + str(
            center[2]) + unit + '", "Radius:=", "' + str(radi) + unit + '", "Height:=",  _\n'
        drw_cyl_code = drw_cyl_code + '"' + str(
            height) + unit + '", "WhichAxis:=", "' + axis + '", "NumSides:=", "0"), Array("NAME:Attributes", "Name:=",  _\n'
        drw_cyl_code = drw_cyl_code + '"' + object_name + '", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=",  _\n'
        drw_cyl_code = drw_cyl_code + '"'+CS+'", "UDMId:=", "", "MaterialValue:=", "" & Chr(34) & "' + material_name + '" & Chr(34) & "", "SolveInside:=",  _\n'
        drw_cyl_code = drw_cyl_code + 'true)\n\n'
        return (drw_cyl_code)



