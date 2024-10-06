#!/bin/bash

if [ $# -gt 0 ]
then
	i=0
	inexistentes=0
	for elemento in $*
	do
		resto=$(($i % 2))
		if [ $resto -ne 0 ]
		then
			if [ -f $elemento ]
			then
				echo "$elemento existe y es un archivo."
			elif [ -d $elemento ]
			then
				echo "$elemento existe y es un directorio."
			else
				let inexistentes++
			fi
		fi
		let i++
	done
	
	echo "De los archivos/directorios pasados como parametros, de aquellos en las posiciones impares, no existen ${inexistentes}."
	exit 0
fi

exit 1
