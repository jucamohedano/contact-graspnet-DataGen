# Development environment for data generation

This docker container gathers all the dependencies to generate the data to train [Contact-GraspNet](https://github.com/NVlabs/contact_graspnet). 

## Steps to obtain the dataset
1. Download the [ACRONYM](https://sites.google.com/nvidia.com/graspdataset) dataset.
2. Download the [ShapeNetSem](https://shapenet.org/) dataset
3. Create watertight manifold meshes from the downloaded meshes following https://github.com/hjwdzh/Manifold

[Link](https://leeds365-my.sharepoint.com/:f:/r/personal/sc19jcm_leeds_ac_uk/Documents/FYP/dataset?csf=1&web=1&e=lDqskN) to watertight manifold meshes


## Example of one of the scenes generated for training

<p align="center">
<img src="https://raw.githubusercontent.com/jucamohedano/contact-graspnet-DataGen/master/docs/example.png" width="500" height="600" class="center">
</p>
