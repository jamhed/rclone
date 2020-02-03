#!/bin/sh -e
if [ -z "$LOCATION" ]; then
	echo "Please provide environment variables required"
	exit 1
fi

if [ "$DOWNLOAD" ]
then
	rclone sync /mnt/private S3:$LOCATION
else
	rclone sync S3:$LOCATION /mnt/private
fi
