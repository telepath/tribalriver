# import sys
# program_name = sys.argv[0]
# arguments = sys.argv[1:]
# count = len(arguments)
#
# usage = "Usage: freecad {} <input_file_name> <obj_label> <stl_file_name> <img_file_name>"
#
# if len(arguments) != 4 :
#     print usage.format(program_name)
#     sys.exit (1)
#
# file_name=arguments[0]
# obj_label=arguments[1]
# outfile_name=arguments[2]
# imgfile_name=arguments[3]
# x_size=2000
# y_size=1500

import FreeCAD

def open(file_name):
    FreeCAD.open(file_name)

def export(obj_label,outfile_name):
    obj=FreeCAD.ActiveDocument.getObjectsByLabel(obj_label)
    import Mesh
    Mesh.export(obj,outfile_name)

def image(obj_label,x_size,y_size,dir_name):
    if hasattr(FreeCAD,'Gui') :
        import git
        repo = git.Repo(search_parent_directories=True)
        sha = repo.head.object.hexsha
        branch = repo.active_branch.name
        dirty = ''
        if repo.is_dirty() :
            dirty = '*'
        import os
        basename=os.path.basename(FreeCAD.ActiveDocument.FileName)
        obj=FreeCAD.ActiveDocument.getObjectsByLabel(obj_label)
        FreeCAD.Gui.activeDocument().getObject(obj[0].Name).Visibility = True
        FreeCAD.Gui.activeDocument().activeView().viewIsometric()
        FreeCAD.Gui.SendMsgToActiveView("ViewFit")
        FreeCAD.Gui.activeDocument().activeView().saveImage(dir_name + '/' + basename + '_' + obj_label + '_' + branch + '_' + sha + dirty + '.png',x_size,y_size,'Current')

def close():
    # FreeCAD.closeDocument(FreeCAD.ActiveDocument.Name)
    if hasattr(FreeCAD,'Gui') :
        FreeCAD.Gui.getMainWindow().close()
    exit()

# export.open(file_name)
# export.image(x_size,y_size,imgfile_name)
# export.export(obj_label,outfile_name)
# export.close()
