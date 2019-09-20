import sys
sys.path.insert(0,'./lib/')
import export

file_name=u'PipeBase.FCStd'
obj_label=u'Fusion'
outfile_name=u'./stl/PipeBase.stl'
imgdir=u'./img/'
x=2000
y=1500

export.open(file_name)
export.export(obj_label,outfile_name)
export.image(obj_label,x,y,imgdir)
export.close()
