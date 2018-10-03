#!/bin/bash

NAME="NODE APP"

mkdir -p /opt/git-node-app
BASE=/opt/git-node-app

APPLICATION_GITHUB_DIRECTORY=$BASE/node-app
#DOCKER_REGISTORY=hub.docker.com
#DOCKER_REGISTORY_ORG=rajteaser
DOCKER_REGISTORY_REPO=rajteaser/node-app
GIT_REPO=https://github.com/rajsharmadotnet/node-app.git
TAG=1.0

if [  -d $APPLICATION_GITHUB_DIRECTORY ];then
     rm -rf $APPLICATION_GITHUB_DIRECTORY
     echo "##################################################################"
     echo "Removed previous github  folder"
fi
echo "##################################################################"
echo "Cloning repo $GIT_REPO"
cd $BASE
git clone $GIT_REPO

echo "##################################################################"
echo "Building image ..."
cd $APPLICATION_GITHUB_DIRECTORY
#cp -f /opt/git-node-app/Dockerfile $APPLICATION_GITHUB_DIRECTORY
#mv -f $APPLICATION_GITHUB_DIRECTORY/Dockerfile_Development $APPLICATION_GITHUB_DIRECTORY/Dockerfile

echo "Clearing traces from previous build"
sudo docker stop docker-node-app
sudo docker rm docker-node-app
#sudo docker rmi $DOCKER_REGISTORY/$DOCKER_REGISTORY_ORG/$DOCKER_REGISTORY_REPO:$TAG
sudo docker rmi $DOCKER_REGISTORY_REPO:$TAG
echo "Building image"
#sudo docker build --no-cache -t $DOCKER_REGISTORY/$DOCKER_REGISTORY_ORG/$DOCKER_REGISTORY_REPO:$TAG .
sudo docker build --no-cache -t $DOCKER_REGISTORY_REPO:$TAG .


echo "##################################################################"
echo "##################################################################"
echo ""
echo ""
echo ""
echo "ALERT ....  IMAGE BUILD SHOULD BE PUSHED TO DOCKER HUB ......"
echo ""
echo ""
echo "Run the follwoing command to push to docker hub"
echo ""
echo ""
#echo "sudo docker login hub.docker.hpecorp.net"
echo "sudo docker login "
#echo "sudo docker push $DOCKER_REGISTORY/$DOCKER_REGISTORY_ORG/$DOCKER_REGISTORY_REPO:$TAG "
echo "sudo docker push $DOCKER_REGISTORY_REPO:$TAG "
