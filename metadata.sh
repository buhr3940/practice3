#!/bin/bash

# assign variables
ACTION=${1}
version='0.5.0'

function create_files() {

curl -w "\n" http://169.254.169.254/latest/dynamic/instance-identity/document/ >> backend1-identity.json
curl -vs https://s3.amazonaws.com/seis665/message.json 2>&1 | tee backend1-message.txt
chmod u+rw /var/log/nginx/access.log access.log
cp /var/log/nginx/access.log access.log

         }

function show_version() {

echo $version
}


function display_help() {

cat << EOF
Usage: ${0} {-c|--create|-h|--help|-v|--version} <filename>
OPTIONS:
	-c | --create   Create new files
	-h | --help	Display the command help
	-v | --version  Show the version of script
Examples:
	Create new files:
		$ ${0} -c
	Display help:
		$ ${0} -h
        Show version:
                $ ${0} -v
EOF
}

case "$ACTION" in
	-h|--help)
		display_help
		;;
	-c|--create)
		create_files
		;;
	 -v|--version)
                show_version
                ;;
	*)
	echo "Usage ${0} {-c|-h|-v}"
	exit 1
esac

