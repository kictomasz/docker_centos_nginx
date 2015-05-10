FROM centos:latest
MAINTAINER Tomasz Kic <kictomasz@gmail.com>

# Add ssh server
RUN yum -y update;
RUN yum -y install openssh-server passwd epel-release supervisor; yum clean all
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' 
RUN echo 'root:root' | chpasswd
RUN sed -ri 's/#PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config

EXPOSE 22 80

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
