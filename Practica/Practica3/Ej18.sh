#!/bin/bash

if [ $# -ne 1 ] #Chequeo si se mandó el parametro.
then
	echo "Se esperaba 1 parametro." >&2
	exit 1
fi

conectado=$(who | grep -w "$1" | cut -d " " -f1)
while [ "$conectado" != "$1"  ]
do
	sleep 10
	conectado=$(who | grep -w "$1" | cut -d " " -f1)
done

echo "Usuario $conectado logueado en el sistema."