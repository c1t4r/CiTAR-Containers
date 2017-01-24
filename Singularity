BootStrap:docker
From:ubuntu:latest
%runscript
echo "This gets run when you run the image!" cd /code exec echo "Hello" "$@"

%post
echo "This section happens once after bootstrap to build the image."
mkdir -p /code
apt-get install vim
echo "Kibbles and bits, but really more bits."
