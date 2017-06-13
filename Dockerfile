FROM centos:centos7
MAINTAINER Stefan Kombrink <stefan.kombrink@uni-ulm.de>
RUN yum -y install deltarpm && yum -y update && yum -y install wget sudo openssh-clients environment-modules initscripts pciutils numactl-libs libpciaccess libibverbs infinipath-psm python-matplotlib strace glibc-devel glibc-headers vim libmlx4 libcxgb3 libmthca libipathverbs libnes gcc-c++
