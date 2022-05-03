#!/usr/bin/python

import os
import shutil

classes_dir = os.listdir('grasps')

#classes = [filename.split('_')[1] for filename in classes_dir]


for c in classes_dir:
    clas = c.split('_')[0]
    mesh = c.split('_')[1]+'.obj'
    source = 'meshes_copy/'+mesh
    destination = 'meshes_by_classes/'+clas+'/'+mesh

    shutil.copy(source, destination)


