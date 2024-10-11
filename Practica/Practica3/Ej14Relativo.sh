#!/bin/bash

if [ $# -ne 3 ] 
then
	echo "Se esperaban 3 parametros." >&2
	exit 1	
fi

if [ ! -d "$1"  ] 
then
	echo "La ruta $1 no existe o no es un directorio." >&2
	exit 2
fi

if [ "$2" != "-a" ] || [ "$2" != "-b" ]
then
	echo "Se esperaba -a o -b como segundo parametro, pero se recibio $2." >&2
	exit 3
fi

#No entiendo si deberia forzar a que el script que me den sea absoluto en caso de que lo pasen relativo, es decir, colocar todas las carpetas previas y las barras???

pushd $1 #Si utilizo cd $1, cd - me permite regresar al directorio en el que estaba antes.
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
