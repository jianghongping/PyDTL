# -*- coding: utf-8 -*-
"""
Created on Tue Jan 30 10:02:43 2018

@author: mohammad
"""
import  math as m

class text_process:
    def __init__(self, file_name):
        self.file_name = file_name
        #self.txt_in = txt_in
        #txt_in,cell_param,


    def extract_param_value(self,txtIn,Param):
        tmp = txtIn[txtIn.find(str(Param)) + len(str(Param)) + 1:txtIn.find(str(Param)) + len(Param) + 30]
        tmp = tmp[0:tmp.find('*')]
        return (tmp)

    def extract_Tank_parameters(self,txtIn):
        Flags_list = ['DRIFT_TUBE_Diameter', 'DIAMeter', 'BORE_radius', 'STEM_radius', 'POST_radius', 'TANK_N',
                      'ADD_STEMS',
                      'ADD_PCS', 'STEMS_4_WALLS', 'PCS_4_WALLS']
        tmp_str = (txtIn.split('#'))

        Tank_prop = str(tmp_str[1])
        DT_prop = str(tmp_str[2])
        DT_prop = DT_prop.replace("\\n', '\\n']", "\\n', '")
        DT_prop = DT_prop.replace("']", "")
        DT_tmp = DT_prop[DT_prop.find(',') + 3:].split("\\n', '")
        DT_geometry = DT_tmp[:DT_tmp.__len__()];

        Tank_prop = Tank_prop.replace('\\t', ' ')
        Tank_prop = ' '.join(Tank_prop.split())

        DT_DTL_radi = [0., 0., 0.]
        STEM_POST = [0., 0.]
        GENERAL_DATA = [''] * 5

        for i in Flags_list:
            tmp = ''
            if i == 'DRIFT_TUBE_Diameter':
                DT_DTL_radi[1] = self.extract_param_value(str(Tank_prop), str(i))
            elif i == 'DIAMeter':
                DT_DTL_radi[2] = self.extract_param_value(str(Tank_prop), str(i))
            elif i == 'BORE_radius':
                DT_DTL_radi[0] = self.extract_param_value(str(Tank_prop), str(i))
            elif i == 'STEM_radius':
                STEM_POST[0] = self.extract_param_value(str(Tank_prop), str(i))
            elif i == 'POST_radius':
                STEM_POST[1] = self.extract_param_value(str(Tank_prop), str(i))
            elif i == 'TANK_N':
                GENERAL_DATA[0] = self.extract_param_value(str(Tank_prop), str(i))
            elif i == 'ADD_STEMS':
                GENERAL_DATA[1] = self.extract_param_value(str(Tank_prop), str(i))
            elif i == 'ADD_PCS':
                GENERAL_DATA[2] = self.extract_param_value(str(Tank_prop), str(i))
            elif i == 'STEMS_4_WALLS':
                GENERAL_DATA[3] = self.extract_param_value(str(Tank_prop), str(i))
            elif i == 'PCS_4_WALLS':
                GENERAL_DATA[4] = self.extract_param_value(str(Tank_prop), str(i))
        return (DT_DTL_radi, STEM_POST, DT_geometry, GENERAL_DATA)

    def IO_read(self):
        file_obj = open(self.file_name, 'r')
        f_text = file_obj.read()
        return (f_text)

    # this function takes a single file or text and return
    #    listed spread shit data
    def IO_read_sp():
        sp_content = []
        file_obj = open(self.file_name, 'r')
        for line in file_obj:
            # print(line)
            txt = line
            line_data = txt.split()
            sp_content.append(line_data)
        return (sp_content)



    def IO_read(self):
        sp_content = []
        file_obj = open(self.file_name, 'r')
        for line in file_obj:
            txt = line
            line_data = txt
            sp_content.append(line_data)
        return (sp_content)

    def extract_cell_parameters_1(self,str_inp, dt_r1, dt_r2, cell_number, cell_offset):
        cell_data_str = (str_inp.split())
        cell_data = [0., ] * len(cell_data_str)
        param_l = [0.0, ] * 12
        param_r = [0.0, ] * 13
        for i in range(0, len(cell_data_str) - 1):
            cell_data[i] = float(cell_data_str[i])
        param_l[0] = cell_data[0] - (cell_data[1] / 2.)
        param_l[1] = cell_data[4]
        param_l[2] = cell_data[5]
        param_l[3] = cell_data[9]
        param_l[4] = cell_data[2] * (m.pi / 180.)
        param_l[5] = cell_data[7]
        param_l[6] = 1  # a var that shows which half cell is cellected (right or left cell)
        param_l[
            7] = 0 + cell_offset  # this vars shows how much each cell is shifted (respect to the low energy DTL wall)
        param_l[8] = dt_r1  # beam pipe radii
        param_l[9] = dt_r2  # drift tube radii
        param_l[10] = cell_number
        param_l[11] = cell_data[11]

        param_r[0] = cell_data[11] - cell_data[0] - (cell_data[1] / 2.)
        param_r[1] = cell_data[4]
        param_r[2] = cell_data[6]
        param_r[3] = cell_data[10]
        param_r[4] = cell_data[3] * (m.pi / 180.)
        param_r[5] = cell_data[8]
        param_r[6] = 0  # a var that shows which half cell is cellected (right or left cell)
        param_r[7] = 0 + cell_data[
            11] + cell_offset  # this vars shows how much each cell is shifted (respect to the low energy DTL wall)
        param_r[8] = dt_r1  # beam pipe radii
        param_r[9] = dt_r2  # drift tube radii
        param_r[10] = cell_number
        param_r[11] = cell_data[11]
        param_r[12] = cell_data[1]
        return (param_l, param_r)

