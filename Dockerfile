FROM centos:latest
MAINTAINER Tomasz Kic <kictomasz@gmail.com>

# Add epel repo 
RUN yum -y install wget
RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Add ssh server
RUN yum -y update;
RUN yum -y install openssh-server passwd; yum clean all
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' 
RUN echo 'root:root' | chpasswd
RUN sed -ri 's/#PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
