# -*- coding: utf-8 -*-
"""
Created on Mon Jan 29 02:33:06 2018

@author: mohammad
"""


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