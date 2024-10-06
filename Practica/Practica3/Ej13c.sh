#!/bin/bash

if [ ! -e "$1"  ] #se supone que el nombre del archivo corresponde a un path relativo.
then
	echo "El archivo/directorio no existe y por lo tanto se creará un directorio con el nombre del archivo pasado como parametro"
	mkdir "$1"
	exit 1
fi
file "$1"
exit 0
