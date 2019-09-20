import sys
sys.path.insert(0,'./lib/')
import export

file_name=u'RiverAssy.fcstd'
obj_label=u'BaseBox'
outfile_name=u'./stl/BaseBox.stl'
imgdir=u'./img/'
x=2000
y=1500

export.open(file_name)
export.export(obj_label,outfile_name)
export.image(obj_label,x,y,imgdir)
export.close()
