FROM centos:latest
MAINTAINER Tomasz Kic <kictomasz@gmail.com>

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd; yum clean all
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
RUN echo 'root:root' | chpasswd
RUN sed -ri 's/#PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config

RUN yum -y update; yum -y httpd; yum clean all
RUN httpd &

EXPOSE 22
EXPOSE 80

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
