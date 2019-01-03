# -*- coding: utf-8 -*-
"""
Created on Tue Jan 23 02:04:46 2018

@author: mohammad
"""
import numpy as np
import math as m


class Draw_2D:
    def __init__(self, cell_param):
        self.cell_param = cell_param

    def three_pointArc_cent(self, x_ini, cent, rot_angle, rot_rad):
        dx = x_ini[0] - cent[0]
        dy = x_ini[1] - cent[1]

        alf_ini = np.angle(np.complex(dx, dy), deg=0)
        mid_ang = 0.
        mid_ang = alf_ini + rot_angle / 2.

        x_mid = [0., ] * 3
        x_end = [0., ] * 3
        x_mid[0] = cent[0] + rot_rad * m.cos(mid_ang);
        x_mid[1] = cent[1] + rot_rad * m.sin(mid_ang);
        x_mid[2] = 0;
        tot_ang = (alf_ini + rot_angle);
        x_end[0] = cent[0] + rot_rad * m.cos(tot_ang);
        x_end[1] = cent[1] + rot_rad * m.sin(tot_ang);
        x_end[2] = 0;
        ArcCordinate1 = [x_ini[0], x_ini[1], 0, 0, 11]
        ArcCordinate2 = [x_mid[0], x_mid[1], x_mid[2], 0, 9]
        ArcCordinate3 = [x_end[0], x_end[1], x_end[2], 0, 10]
        ArcCordinate = [ArcCordinate1, ArcCordinate2, ArcCordinate3]
        return (ArcCordinate)

    def make_half_DT_script(self,s1,s2,part_name):
        strMulti = ''
        strMulti = strMulti + 'oEditor.CreatePolyline Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=",  _\n'
        strMulti = strMulti + 'true, _\n'
        strMulti = strMulti + s2 +',   _\n'
        strMulti = strMulti + s1 +', _\n'
        strMulti = strMulti + 'Array("NAME:PolylineXSection", "XSectionType:=",  _\n'
        strMulti = strMulti + '  "None", "XSectionOrient:=", "Auto", "XSectionWidth:=", "0mm", "XSectionTopWidth:=",  _\n'
        strMulti = strMulti + '  "0mm", "XSectionHeight:=", "0mm", "XSectionNumSegments:=", "0", "XSectionBendType:=",  _\n'
        strMulti = strMulti + '  "Corner")), Array("NAME:Attributes", "Name:=", "'+ part_name +'", "Flags:=", "", "Color:=",  _\n'
        strMulti = strMulti + '  "(143 175 143)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=",  _\n'
        strMulti = strMulti + '  "", "MaterialValue:=", "" & Chr(34) & "vacuum" & Chr(34) & "", "SolveInside:=",  _\n'
        strMulti = strMulti + '  true, "IsMaterialEditable:=", true)\n'
        return ('\n'+strMulti)

    def draw_a_Half_cell(self):
        # make sure that inputs are float not int
        for i in range(0, len(self.cell_param)):
            self.cell_param[i] = self.cell_param[i]
        # extract single cell parameters

        rot_rad1 = self.cell_param[2]
        rot_rad2 = self.cell_param[3]
        rot_rad3 = self.cell_param[1]
        dthlf = self.cell_param[0] - rot_rad1
        rot_ang_face = self.cell_param[4]
        flat = self.cell_param[5]
        isrightHalf = self.cell_param[6]
        offset = self.cell_param[7]
        dt_r1 = self.cell_param[8]
        dt_r2 = self.cell_param[9]
        CELLNUMBER = self.cell_param[10]

        cell = [0, 0]
        # draw half drift tube 2D
        out_00 = [[0, dt_r1, 0, 0, 10]]
        rot_angle = m.pi / 2
        rot_rad = rot_rad1;
        x_i = [0 + dthlf, dt_r1]
        cent = [0 + dthlf, dt_r1 + rot_rad]
        out_01 = self.three_pointArc_cent(x_i, cent, rot_angle, rot_rad)

        rot_angle = rot_ang_face
        rot_rad = rot_rad2
        x_i = [out_01[2][0], out_01[2][1] + flat]
        cent = [out_01[2][0] - rot_rad, out_01[2][1] + flat];
        out_02 = self.three_pointArc_cent(x_i, cent, rot_angle, rot_rad)
        rot_angle = m.pi / 2. - (rot_ang_face)
        rot_rad = rot_rad3
        ytt = rot_rad * (1 - m.cos(rot_angle))
        ytt = dt_r2 - ytt
        dy1 = ytt - out_02[2][1];
        x1 = m.tan(rot_ang_face) * dy1

        x_i = [out_02[2][0] - x1, ytt]
        cent = [out_02[2][0] - x1 - (rot_rad * (m.cos(rot_ang_face))), dt_r2 - rot_rad];
        out_03 = self.three_pointArc_cent(x_i, cent, rot_angle, rot_rad)

        out_04 = [[0, dt_r2, 0, 0, 10], [0, dt_r1, 0, 0, 10]]
        out = out_00 + out_01 + out_02 + out_03 + out_04


        closed_poly = 'true';
        covered_poly = 'true';

        # mirror the left hand side of drift tube
        if isrightHalf == 0.:
            obj_name = 'DT_h_l' + str(int(CELLNUMBER))
            for i in range(0, len(out)):
                out[i][0] = -1 * out[i][0]
        elif isrightHalf == 1.:
            obj_name = 'DT_h_r' + str(int(CELLNUMBER))
        # move whole drift tube to its real location
        for i in range(0, len(out)):
            out[i][0] = offset + out[i][0]

        pointsLocations = out
        tmp = self.creat_multiline_vbscript(obj_name, pointsLocations, closed_poly, covered_poly)

        return (obj_name, tmp)

    def creat_multiline_vbscript(self, obj_name, pointsLocations, closed_poly, covered_poly):
        strPoin = ''
        strSeg = ''
        strMulti = ''
        ind = 0

        pllen = len(pointsLocations) - 1
        for j in range(0, pllen + 1):
            if j != pllen:
                strPoin = strPoin + ' Array("NAME:PLPoint", "X:=", "' + str(
                    pointsLocations[j][0]) + 'cm", "Y:=", "' + str(pointsLocations[j][1]) + 'cm", "Z:=", "' + str(
                    pointsLocations[j][2]) + 'cm") , _ \n'
            elif j == pllen:
                strPoin = strPoin + ' Array("NAME:PLPoint", "X:=", "' + str(
                    pointsLocations[j][0]) + 'cm", "Y:=", "' + str(pointsLocations[j][1]) + 'cm", "Z:=", "' + str(
                    pointsLocations[j][2]) + 'cm")  _ \n'

            if j < pllen:
                if pointsLocations[j][4] == 10:
                    if ind != pllen - 1:
                        strSeg = strSeg + 'Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", ' + str(
                            ind) + ', "NoOfPoints:=", 2), _ \n'
                    else:
                        strSeg = strSeg + 'Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", ' + str(
                            ind) + ', "NoOfPoints:=", 2) '

                    ind = ind + 1;
                elif pointsLocations[j][4] == 11:
                    if ind != pllen - 3:
                        strSeg = strSeg + ' Array("NAME:PLSegment", "SegmentType:=", "Arc", "StartIndex:=", ' + str(
                            ind) + ', "NoOfPoints:=", 3, "NoOfSegments:=", "0"),  _\n'
                    else:
                        strSeg = strSeg + ' Array("NAME:PLSegment", "SegmentType:=", "Arc", "StartIndex:=", ' + str(
                            ind) + ', "NoOfPoints:=", 3, "NoOfSegments:=", "0")'

                    ind = ind + 2;

        s2 = 'Array("NAME:PolylinePoints",' + strPoin + ')'
        s1 = 'Array("NAME:PolylineSegments",' + strSeg + ')'
        Half_dt_script   = self.make_half_DT_script(s1,s2,obj_name)
        return (Half_dt_script)








