## Automated Builds for JUSTUS HPC Base System Containers

These containers serve as base system images for running HPC multicore and multinode jobs on the bwForCluster JUSTUS. 
They are automatically updated when the base system image on the cluster changes.
After a short delay the new builds appear on the hubs and can be pulled to customize containers.
The following builds are available:

* Docker Hub 
* Singularity Hub

They can be pulled using docker or singularity as follows:

>docker pull c1t4r/citar-containers

>singularity pull docker://c1t4r/citar-containers

>singularity pull shub://c1t4r/citar-containers

## Build History

* updated build: 2017-06-13-14-42

* updated build: 2017-06-13-15-10
