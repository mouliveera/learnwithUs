## 24-05-2022
- Create a gitHub account
- Copy ssh keys to your profile.
```
ssh-keygen
> Enter
> Enter
> Enter
---
# cd to your home directory
# You can view id_rsa, id_rsa.pub
cd ~/.ssh/
ls -l

cat id_rsa.pub

Add that key to SSH keys in gitHub.
```

Follow: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
---
#### Commands:
- git clone <REPOSITORY_URL> # How to clone a repo
- git branch  # List the gitHub branches
- git checkout -b <"NEW_BRANCH_NAME"> # For creating a new branch
- git checkout <BRANCH> # Change the branch
- git status # List the files modified/added/removed
- git add <fileName> # Adding files to local brach
- git add .  # Add all files at a time
- git add -A # Same as above^^
- git commit # Short description note for the changes
- git push origin <BRANCH_NAME> # Push the changes to remote branch
- git pull # Pull the latest changes from remote branch

#### Tools:
- Markdown page document: https://www.markdownguide.org/basic-syntax/
- Terminals for windows: https://alternativeto.net/software/iterm2/?platform=windows [ubuntu is recommended]


## 27-05-2022
- How to configure GitHub MFA and SSH keys. ref: https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication
- GitHub Primary and secondary emails.
- AWS cli configure. Ref: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
- AWS IAM Access and Secret keys.
- AWS IAM console and commands line access.

## 30-05-2022
- How to create an EC2 instance manually.
- How to  create using command line:
```
aws ec2 run-instances --image-id ami-09d56f8956ab235b3 --count 1 --instance-type t2.micro --key-name 2022-keys --security-group-ids sg-0f3fe841c82949693 --subnet-id subnet-0
c70565aaa3cb5ddc --associate-public-ip-address --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=commanLine-1}]' --profile personal
```

Source: https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-instances.html

- How to login to the EC2 instances.
- Fill out root disk and resizing ROOT disks.
- Rough Notes
 ```
 # Create a 5Gb file
 ubuntu@ip-10-0-1-109:/$ sudo fallocate -l 5G file.out

 ---
 ubuntu@ip-10-0-1-52:~$ lsblk
NAME     MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0      7:0    0 26.6M  1 loop /snap/amazon-ssm-agent/5163
loop1      7:1    0 55.5M  1 loop /snap/core18/2344
loop2      7:2    0 61.9M  1 loop /snap/core20/1405
loop3      7:3    0 79.9M  1 loop /snap/lxd/22923
loop4      7:4    0 43.6M  1 loop /snap/snapd/15177
xvda     202:0    0   12G  0 disk
├─xvda1  202:1    0  7.9G  0 part /
├─xvda14 202:14   0    4M  0 part
└─xvda15 202:15   0  106M  0 part /boot/efi
ubuntu@ip-10-0-1-52:~$ ^C
ubuntu@ip-10-0-1-52:~$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       7.6G  6.5G  1.2G  86% /
tmpfs           484M     0  484M   0% /dev/shm
tmpfs           194M  828K  193M   1% /run
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/xvda15     105M  5.3M  100M   5% /boot/efi
tmpfs            97M  4.0K   97M   1% /run/user/1000

ubuntu@ip-10-0-1-52:~$ sudo growpart /dev/xvda 1
CHANGED: partition=1 start=227328 old: size=16549855 end=16777183 new: size=24938463 end=25165791
ubuntu@ip-10-0-1-52:~$ sudo resize2fs /dev/xvda1
resize2fs 1.46.5 (30-Dec-2021)
Filesystem at /dev/xvda1 is mounted on /; on-line resizing required
old_desc_blocks = 1, new_desc_blocks = 2
The filesystem on /dev/xvda1 is now 3117307 (4k) blocks long.

ubuntu@ip-10-0-1-52:~$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        12G  6.5G  5.0G  57% /
tmpfs           484M     0  484M   0% /dev/shm
tmpfs           194M  828K  193M   1% /run
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/xvda15     105M  5.3M  100M   5% /boot/efi
tmpfs            97M  4.0K   97M   1% /run/user/1000
 ```

Ref: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/recognize-expanded-volume-linux.html

## 31-05-2022

- Discussed docker image concepts
- Rough notes:
- Dockerfile:
---
FROM ubuntu:20.04
COPY ./mveera /mveera
CMD ["/mveera"]
RUN apt update
RUN apt-get install redis -y
---

- Build an image
```
docker build -t mveera-ubuntu-redis:latest .
docker images
```
- Login to docker container
```
docker ps # Lists the containers running
dcoker exec -it <CONTAINER-ID> bash # Login
```

- Create a container with an image and login to the container
```
docker run -it <IMAGE ID>  bash
```

- Create a container in detach mode
```
docker run -it -d <IMAGE ID>  bash
```

- Docker login to your account and push the images to the DockerHub
```
docker login   #Login to you dockerHub account

docker images

docker tag <IMAGE ID> <YOUR IMAGE NAME>:<TAG>
Ex:
docker tag b55df6b4b60d mveera-ubuntu-redis:1.0 #Give a tag[Commit in gitHub] to the image
```
---
```
docker image push <REGISTRY NAME>/<YOUR IMAGE NAME>:<TAG>
Ex:
docker image push mouliveera/mveera-ubuntu-redis:1.0
```

Sources:
- https://docs.docker.com/engine/reference/commandline/tag/
- https://docs.docker.com/engine/reference/commandline/push/
