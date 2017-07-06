# dockerTestTools
Setting up an test and stage enviroment for deploymets

## install docker
``` yum install docker ```

## install docker compose
```
sudo yum install epel-release
sudo yum install -y python-pip
sudo pip install docker-compose

 systemctl start docker 
 systemctl status docker
 systemctl enable docker
```

## accessing git docker
```
ssh  -l root  -p 2222  root@192.168.99.100 -o StrictHostKeyChecking=no
git clone ssh://root@192.168.99.100:2222/home/repos/sampleProject

```

## How to create a new repo:
```
$ cd myrepo
$ git init --shared=true
$ git add .
$ git commit -m "my first commit"
$ cd ..
$ git clone --bare myrepo myrepo.git
```
## How to upload a repo:

From host:
```$ mv myrepo.git ~/git-server/repos```
From remote:
```$ scp -r myrepo.git user@host:~/git-server/repos```
How clone a repository:
```
$ git clone ssh://git@<ip-docker-server>:2222/git-server/repos/myrepo.git
```