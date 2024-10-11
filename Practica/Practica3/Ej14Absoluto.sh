#!/bin/bash

if [ $# -ne 3 ] || [ ! -d "$1"  ] || [ "$2" != "-a" ] || [ "$2" != "-b" ] #No entiendo si deberia forzar a que el script que me den sea absoluto en caso de que lo pasen relativo, es decir, colocar todas las carpetas previas y las barras???
then
	exit 1
else
	pushd $1 #Si utilizo cd $1, debo guardarme antes el directorio actual para volver antes de terminar el script??
	#Con la previa linea me independizo de como me llega el directorio.	

	for file in *	# $file va a indicar solo el nombre base del archivo puesto que estoy dentro del directorio. con for file in $1/* sucedia que file tomaba todo el path si imaginamos que $1 indica path absoluto

			do
				if [ -f "$file" ]
				then
					if [ "$2" = "-a" ]
					then
						mv "$file" "${file}${3}"
					else
						mv "$file" "${3}${file}"
					fi

				fi
			done

	popd
	exit 0	
fi
