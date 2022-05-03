import os

grasps = os.listdir('./grasps')
computed = os.listdir('./simplified_watertight_manifold')

with open('missing1.txt', 'w') as f:
    for mesh in grasps:
        
        if mesh.split('_')[1]+'.obj' in computed:
            continue
        else:
            f.write(mesh.split('_')[1]+'.obj'+'\n')
f.close()

