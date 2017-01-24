BootStrap:docker
From:centos:7

%runscript
echo "This gets run when you run the image!" cd /code exec echo "Hello" "$@"

%test
export PATH="/usr/local/gromacs/bin:$PATH"
export OMP_NUM_THREADS=1
time mpirun -n 2 -x OMP_NUM_THREADS -x PATH -x LD_LIBRARY_PATH gmx_mpi_d mdrun -s /in/ion_channel.tpr -maxh 0.50 -resethway -noconfout -nsteps 500 -g logfile

%post
echo "Preparing system container"
mkdir -p /code
yum -y install vim
yum -y groupinstall "Development Tools"  # for ompi
yum -y install libxml2-devel cmake wget       # for gromacs
yum -y groupinstall "Infiniband Support"
yum clean all

mkdir -p /etc/ssh /scratch /var/spool/torque /nfs

echo "Building openmpi"
cd /tmp
git clone https://github.com/open-mpi/ompi.git
cd ompi
./autogen.pl
./configure --with-tm=no --with-slurm=no --enable-mpirun-prefix-by-default --prefix=/usr/local
make -j 16
make install

### Building gromacs
cd /tmp
wget ftp://ftp.gromacs.org/pub/gromacs/gromacs-5.1.4.tar.gz
tar xzf gromacs-5.1.4.tar.gz
cd gromacs-5.1.4
mkdir -p build && cd build
cmake .. -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON -DGMX_MPI=on  -DGMX_DOUBLE=on -DGMX_BUILD_UNITTESTS=ON
make -j 16
#make check ### fix them!
make install

### Obtaining JUSTUS-related data
mkdir -p /in
mkdir -p /out
wget www.uni-ulm.de/~nsn25/CiTAR/gromacs/ion_channel.tpr -O /in/ion_channel.tpr
chmod a+r /in/ion_channel.tpr

