#!/bin/sh -e
if [ -z "$LOCATION" ]; then
	echo "Please provide environment variables required"
	exit 1
fi
rclone sync S3:$LOCATION
