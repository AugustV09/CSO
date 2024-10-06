#!/bin/bash

if [ ! -d "$1"  ]
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
					mv "$file" "${1}${name}${3}" #Acá no hace falta usar basename pero lo deje para tener la misma estructura en ambos casos.
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
