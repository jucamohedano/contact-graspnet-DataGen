#!/usr/bin/python3.8

from shutil import move
import os

all_models_dir = 'all_models/dir_020'
# all_models_dir = 'nonWatertight_computed_models'
all_models = os.listdir(all_models_dir)

computed_models_dir = 'all_models/dir_020_z'
computed_models = os.listdir(computed_models_dir)

destination_dir = 'nonWatertight_computed_models'
# destination_dir = 'all_models/dir_016_z'
for c in computed_models:
	for model in all_models:
		if c == model:
			# move(computed_models_dir+'/'+c, destination_dir)
			move(all_models_dir+'/'+c, destination_dir)


