# -*- coding: utf-8 -*-
"""
Created on Mon Jan 29 02:33:06 2018

@author: mohammad
"""
import numpy as m 

def rotate_cordinateSystem(tuner_angle,tuner_location,cordinate_name): 
    rot_cordinate_script= 'oEditor.CreateRelativeCS Array'+\
    '("NAME:RelativeCSParameters", "Mode:=", "Axis/Position", "OriginX:=", _\n'+\
    '"'+str(tuner_location)+'cm", "OriginY:=", "0mm", "OriginZ:=", "0mm",'+\
    ' "XAxisXvec:=", "0mm", _\n'+\
    '"XAxisYvec:=",  _ \n  "'+str(m.cos(tuner_angle*m.pi/180))+'mm",'+\
    ' "XAxisZvec:=", "'+str(m.sin(tuner_angle*m.pi/180))+'mm", "YAxisXvec:=",  _ \n'+\
    '"0mm", "YAxisYvec:=", "'+str(m.cos((m.pi/2)+(tuner_angle*m.pi/180)))+'mm", "YAxisZvec:=",  _\n'+\
    '"'+str(m.sin((m.pi/2)+(tuner_angle*m.pi/180)))+'mm"),'+\
    ' Array("NAME:Attributes", "Name:=", "'+cordinate_name+'")\n\n'
    return(rot_cordinate_script) 
def workingCS(new_cs): #CS = cordinate system, 
    Change_workingCS_script = 'oEditor.SetWCS Array("NAME:SetWCS Parameter",'+\
    ' "Working Coordinate System:=", "'+new_cs+'", "RegionDepCSOk:=",  _\n false)\n\n'
    return(Change_workingCS_script)
    
    
def SweepAroundAx(obj_name, axis, rot_angle):
    swp_code = 'oEditor.SweepAroundAxis _\n'   '\tArray("NAME:Selections", "Selections:=", "' + obj_name + '"), _\n'    '\tArray("NAME:AxisSweepParameters", _ \n'
    swp_code = swp_code + '\t\t"DraftAngle:=", 0, _ \n'     '\t\t"DraftType:=", "Round", _ \n'  '\t\t"SweepAxis:=", "' + axis + '", _ \n'  '\t\t"SweepAngle:=", ' + rot_angle + ') \n'
    return (swp_code)


def union_objects(obj_names, KeepOriginals):
    unit_code = ''
    for i in obj_names:
        unit_code = unit_code + i + ','
    unit_code = unit_code[0:len(unit_code) - 1]
    unit_code = 'oEditor.Unite Array("NAME:Selections", "Selections:=","' + unit_code + '"),Array("NAME:UniteParameters", "KeepOriginals:=",' + KeepOriginals + ')'
    return (unit_code)

def rotate_object(obj_name,axis,ang):
    rot_script  = 'oEditor.Rotate Array("NAME:Selections", "Selections:=", "'+obj_name+'", "NewPartsModelFlag:=",  _\n'
    rot_script += '"Model"), Array("NAME:RotateParameters", "RotateAxis:=", "'+axis+'", "RotateAngle:=",  _ \n "'+str(ang)+'deg")\n'
    return(rot_script)

def subtract_objects(main_objects, tool_objects, KeepOriginals):
    subt_code = ''
    tools_list = ''
    main_list = ''
    for i in main_objects:
        main_list = main_list + i + ','
    main_list = main_list[0:len(main_list) - 1]

    for i in tool_objects:
        tools_list = tools_list + i + ','
    tools_list = tools_list[0:len(tools_list) - 1]

    subt_code = 'oEditor.Subtract _' '\n' 'Array("NAME:Selections", _' '\n' '"Blank Parts:=", "' + main_list + '",_ \n' '"Tool Parts:=", "' + tools_list + '"),_'
    subt_code = subt_code + '\n' 'Array("NAME:SubtractParameters", _ \n "KeepOriginals:=", ' + KeepOriginals + ' )'
    return (subt_code)