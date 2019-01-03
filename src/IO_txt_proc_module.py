import  math as m
import  re

class text_process:
    def __init__(self, file_name):
        self.file_name = file_name

    def IO_read(self):
        reSepParts = re.compile('(\t|\r|\n)')  
        OnlyWordInputs = re.compile(r'[a-zA-Z_]+')
        OnlyNumericInputs = re.compile(r'-?\d+[\.\d]*')
        postcouplerInputs = re.compile(r'posts_loc|posts_h|tuners_loc|tuners_h|tuners_a')
        # The cell parameter flags for creating cell_parameters_dictionary
        cell_data_flags=[ 'GapCen','GapLen','AngL','AngR','Rc',\
                         'Rni_L','Rni_R','FlatL','FlatR','Rno_L','Rno_R',\
                         'Length','E0','cell_number']
        # define output variable
        cell_properties = list()
        TankParameterDict = dict()
        post_l_location = list()
        post_h_location = list()
        postcoupler_data = list()
        tuner_data = dict()
        

        # to count cell number, start from 0
        cell_count = int()
                
        for line in open(self.file_name, 'r'):#read the input files                  
            #remove the new line and tab charachters
            lineWOs = reSepParts.sub('', line.lower())
            #check if the line includes only numerics                
            if OnlyWordInputs.search(lineWOs)==None:
                tmp_cell_datas = OnlyNumericInputs.findall(lineWOs)
                tmp_cell_data  = [float(i) for i in tmp_cell_datas]
                if len(tmp_cell_data)==13:
                    tmp_cell_data.append(cell_count)
                    cell_properties.append(dict(zip(cell_data_flags,tmp_cell_data)))
                    cell_count +=1                       
            #to fill the dictionary for the general properties                      
            elif len(OnlyWordInputs.findall(lineWOs))==2:
                tmp = OnlyWordInputs.findall(lineWOs)
                TankParameterDict[tmp[0]] = tmp[1]
            elif postcouplerInputs.match(lineWOs)!=None:
                if postcouplerInputs.match(lineWOs).group(0)=='tuners_h':
                    tmp = lineWOs[postcouplerInputs.match(lineWOs).end():]
                    
                    tmplist = OnlyNumericInputs.findall(tmp)
                    tmpTuner_h = [float(i) for i in tmplist]                    
 
                if postcouplerInputs.match(lineWOs).group(0)=='tuners_a':
                    tmp = lineWOs[postcouplerInputs.match(lineWOs).end():]
                    
                    tmplist = OnlyNumericInputs.findall(tmp)
                    tmpTuner_a = [float(i) for i in tmplist]                    

                if postcouplerInputs.match(lineWOs).group(0)=='tuners_loc':
                    tmp = lineWOs[postcouplerInputs.match(lineWOs).end():]
                    
                    tmplist = OnlyNumericInputs.findall(tmp)
                    tmpTuner_l = [float(i) for i in tmplist]                    
                            
                if postcouplerInputs.match(lineWOs).group(0)=='posts_h':
                    tmp = lineWOs[postcouplerInputs.match(lineWOs).end():]
                    
                    tmplist = OnlyNumericInputs.findall(tmp)
                    post_h_location = [float(i) for i in tmplist]                    
 
                elif postcouplerInputs.match(lineWOs).group(0)=='posts_loc':                    
                    tmp = lineWOs[postcouplerInputs.match(lineWOs).end():]                    
                    tmplist = OnlyNumericInputs.findall(tmp)
                    post_distribution = [float(i) for i in tmplist]  
                     
            else:    
                try:
                    TankParameterDict[re.search(r'[a-zA-Z_]+',lineWOs).\
                      group()] = float(re.search(r'[+-]?\d+[\.\d]*',\
                                      lineWOs).group())
                except:#to ignor the errors and exceptions
                    pass    
        post_l_location = range(-1*int(post_distribution[0]),len(cell_properties),\
                                -1*int(post_distribution[1]))
        if len(post_l_location)>len(post_h_location):
            print('warning: the hight of postcoupler numbers ['+str(1+len(post_h_location))+\
                  '-' +str(len(post_l_location))+'] are missing in the input files'+\
                  ' and replaced by 1.23456 cm by code')
            for i in post_l_location[len(post_h_location):]:
                post_h_location.append(1.23456)
        elif len(post_l_location)>len(post_h_location):
            print('warning: the number of hight given for post-couplers are'+
                  ' bigger than number of post-couplers. The last numbers are removed')
        postcoupler_data = zip(post_l_location,post_h_location)
        tuner_data = zip(tmpTuner_l,tmpTuner_h,tmpTuner_a)
        return([TankParameterDict,cell_properties,postcoupler_data,tuner_data])
    def post_coupler_input(self,TankParam,cell_prop,cell_offset):
        pass
        
    def cell_parameters_final_list(self,TankParam,cell_prop,cell_offset):
        param_l = list()        
        param_l.append(cell_prop['GapCen']-(cell_prop['GapLen']/2))
        param_l.append(cell_prop['Rc'])#4
        param_l.append(cell_prop['Rni_L'])#5
        param_l.append(cell_prop['Rno_L'])#9
        param_l.append(cell_prop['AngL']*m.pi/180.0)#2
        param_l.append(cell_prop['FlatL'])#7
        # a var that shows which half cell is cellected (right or left cell)
        param_l.append(1)
        param_l.append(cell_offset)
        param_l.append(TankParam['bore_diameter']/2.)
        param_l.append(TankParam['dt_diameter']/2.)
        param_l.append(cell_prop['cell_number'])
        param_l.append(cell_prop['Length'])
        param_l.append(cell_prop['GapLen'])
        
        param_r = list()        
        param_r.append(cell_prop['Length']-cell_prop['GapCen']-\
                                                   (cell_prop['GapLen']/2))
        param_r.append(cell_prop['Rc'])#4
        param_r.append(cell_prop['Rni_R'])#6
        param_r.append(cell_prop['Rno_R'])#10
        param_r.append(cell_prop['AngR']*m.pi/180.0)#3*pi/180
        param_r.append(cell_prop['FlatR'])#8
        # a var that shows which half cell is cellected (right or left cell)
        param_r.append(0)
        param_r.append(cell_prop['Length']+cell_offset)
        param_r.append(TankParam['bore_diameter']/2.)
        param_r.append(TankParam['dt_diameter']/2.)
        param_r.append(cell_prop['cell_number'])
        param_r.append(cell_prop['Length'])
        param_r.append(cell_prop['GapLen'])
        return(param_r,param_l)
        
 
