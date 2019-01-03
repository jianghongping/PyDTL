import sys
sys.path.append('./src')
from Create_DTL_script import *

file_name = 'PyDTL.in'
file = open('PyDTL_OUT.vbs','w')

s = exec_pydtl(file_name)
#print(s)
file.write(s)
file.close()

