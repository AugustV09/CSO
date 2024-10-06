#!/bin/bash

if [ ! -d "$1"  ] #No entiendo si deberia forzar a que el script que me den sea absoluto en caso de que lo pasen relativo, es decir, colocar todas las carpetas previas y las barras???
then
	exit 1
else
	case "$2" in
		"-a")
			for file in "$1"*
			do
				if [ -f "$file" ]
				then
					name=$(basename "$file")
					mv "$file" "${1}${name}${3}" #No hace falta usar basename acá pero lo deje para tener la misma estructura en ambos casos.
				fi
			done
		;;
		"-b")
			for file in "$1"*
			do
				if [ -f "$file" ]
				then
					name=$(basename "$file")
					mv "$file" "${1}${3}${name}"
				fi
			done
		;;
		*)
			exit 2
		;;
	esac
	exit 0	
fi
