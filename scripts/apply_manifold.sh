#!/usr/bin/sh
export PATH=$PATH:~/contact-graspnet-DataGen/Manifold/build
for FILE in *obj; do
    manifold --input $FILE --output ~/contact-graspnet-DataGen/manifold_meshes/manifold_$FILE
done
