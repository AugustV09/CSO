#!/bin/bash

if [ $# -eq 1 ] && [ -d "$1" ]
then
	permisoR=0
	permisoW=0

	for archivo in "${1}"/*
	do
		if [ -f "$archivo" ]
		then
			if [ -r "$archivo" ]
			then
				let permisoR++
			fi

			if [ -w "$archivo" ]
			then
				let permisoW++
			fi
		fi
	done
	echo "Contandolos por separado, hay $permisoR archivos con permiso de lectura y $permisoW archivos con permiso de escritura."
	exit 0
fi

exit 4
