#!/bin/bash 
function makedirs () {
echo "1. create dirs"
cd ~/Desktop
mkdir -p aws/{EC2/{Instances,SecurityGroups},S3/{api,Images},RDS/{Instances,Snapshots,Objects}}

echo "2. Move Objects to S3"
mv aws/RDS/Objects aws/S3

echo "3. Rename api to Buckets"
mv aws/S3/api aws/S3/Buckets

echo "4. copy images to ec2 in abs"
cp -r /home/$USER/Desktop/aws/S3/Images /home/$USER/Desktop/aws/EC2

echo "5. delete s3 images in rel"
rm -rf ./aws/S3/Images

echo "6. create ne file"
touch aws/RDS/rds.txt

echo "7. remove aws"
rm -rvf aws
}

function chckfile() {
	read -rp "Enter a filename to check: " fname
	if [[ ! -e $fname ]]
		then
			echo "file doesnt exists"
		else
			rm -i $fname
	fi
}










