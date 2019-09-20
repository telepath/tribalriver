import sys
sys.path.insert(0,'./lib/')
import export

file_name=u'PipeLid.FCStd'
obj_label=u'Body'
outfile_name=u'./stl/PipeLid.stl'
imgdir=u'./img/'
x=2000
y=1500

export.open(file_name)
export.export(obj_label,outfile_name)
export.image(obj_label,x,y,imgdir)
export.close()
