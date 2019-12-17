FROM centos:latest
MAINTAINER Tomasz Kic <kictomasz@gmail.com>

COPY etc/nginx.repo /etc/yum.repos.d/
RUN yum -y update && yum -y install nginx;
COPY html/index.html  /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
