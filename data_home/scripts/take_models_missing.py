import os
import shutil

models = os.listdir('models')

f = open('missing.txt', mode='r')
file_list = f.read().split('\n')
for mesh_name in file_list:
    shutil.copy('./models/'+mesh_name, './models_missing/'+line)
