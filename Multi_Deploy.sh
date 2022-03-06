#!/bin/bash

#This script will deploy website in multiple server

USR='devops'

for host in `cat remhost`
do
    echo "##########################################"
    echo "Connecting to $host"
    echo "##########################################"
    echo
    echo "##########################################"
    echo "Pushing Script on $host"
    echo "##########################################"
    echo
    scp MultiOS_Web_Deployment.sh $USR:$host:/opt
    echo "##########################################"
    echo "Executing Script on $host"
    echo "##########################################"
    echo
    ssh $USR:$host sudo /opt/MultiOS_Web_Deployment.sh
    echo "##########################################"
    echo "Removing Temp Files From $host"
    echo "##########################################"
    echo
    ssh $USR:$host sudo rm -rf /opt/MultiOS_Web_Deployment.sh
    echo "##########################################"
    echo "Deployment complete on $host"
    echo "##########################################"
    echo
done