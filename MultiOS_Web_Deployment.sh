#!/bin/bash

#using this script will deploy website in centos and ubuntu

#!/bin/bash

# Global Variables
URL="https://templatemo.com/tm-zip-files-2020/templatemo_522_venue.zip"
ART_NAME="templatemo_522_venue"

yum -help &> /dev/null

if [ $? -eq 0 ]
then
	# Define Variables for centos
	PACKAGE="wget unzip httpd"
	SVC="httpd"
	
	echo "###################################"
	echo "Deplyoying in Centos Server"
	echo "###################################"
	# Installing Package
	echo "###################################"
	echo "Installing Package"
	echo "###################################"
	sudo yum install $PACKAGE -y &> /dev/null
	echo
	
	# Initilizaing the httpd service
	echo "###################################"
	echo "Initilizaing the httpd service"
	echo "###################################"
	sudo systemctl enable $SVC
	sudo systemctl start $SVC
	echo
	
	# Deploying project
	echo "###################################"
	echo "Deploying project"
	echo "###################################"
	cd /tmp
	mkdir webfiles
	cd webfiles
	wget $URL &> /dev/null
	unzip $ART_NAME.zip &> /dev/null
	cd $ART_NAME
	cp -r * /var/www/html/
	echo
	
	# Restarting Service
	echo "###################################"
	echo "Restarting Service"
	echo "###################################"
	systemctl restart $SVC
	echo
	
	# Deleting Files 
	echo "###################################"
	echo "Deleting Temp Files"
	echo "###################################"
	cd /tmp
	rm -rf webfiles
	echo
	echo "###################################"
	echo "Deployment completes of Centos Machine"
	echo "###################################"

else
	# Define Variables for centos
	PACKAGE="wget unzip apache2"
	SVC="apache2"
	
	echo "###################################"
	echo "Deplyoying in Ubuntu Server"
	echo "###################################"
	# Installing Package
	echo "###################################"
	echo "Installing Package"
	echo "###################################"
	sudo apt update
    	sudo apt install $PACKAGE -y &> /dev/null
	echo
	
	# Initilizaing the httpd service
	echo "###################################"
	echo "Initilizaing the httpd service"
	echo "###################################"
	sudo systemctl enable $SVC
	sudo systemctl start $SVC
	echo
	
	# Deploying project
	echo "###################################"
	echo "Deploying project"
	echo "###################################"
	cd /tmp
	mkdir webfiles
	cd webfiles
	wget $URL &> /dev/null
	unzip $ART_NAME.zip &> /dev/null
	cd $ART_NAME
	cp -r * /var/www/html/
	echo
	
	# Restarting Service
	echo "###################################"
	echo "Restarting Service"
	echo "###################################"
	systemctl restart $SVC
	echo
	
	# Deleting Files 
	echo "###################################"
	echo "Deleting Temp Files"
	echo "###################################"
	cd /tmp
	rm -rf webfiles
	echo
	echo "###################################"
	echo "Deployment completes of Ubuntu Machine"
	echo "###################################"

fi
