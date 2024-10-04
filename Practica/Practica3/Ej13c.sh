#!/bin/bash

if [ ! -e "$1"  ]
then
	echo "El archivo/directorio no existe y por lo tanto se creará un directorio con el nombre del archivo pasado como parametro"
	mkdir "$1"
	exit 1
fi
file "$1"
exit 0
