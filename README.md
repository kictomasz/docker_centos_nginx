# Centos with ssh and EPEL REPO

Docker instalation with ssh and epel repo

# Instalation 

You can change root password in DOCKERFILE. Edit DOCKERFILE and change 

```bash 
RUN echo 'root:root' | chpasswd
``` 

root:root - login root password root 
root:passwd - login root, password is password

The easiest way to get this docker image installed is to pull the latest version
from the Docker registry:

```bash
$ docker pull kictomasz/centos-ssh
```

If you'd like to build the image yourself then:

```bash
$ git clone git@github.com:kictomasz/centos_ssh.git
$ cd centos_ssh
$ sudo docker build -t="name" .
```


