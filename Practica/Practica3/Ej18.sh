#!/bin/bash

if [ $# -ne 1  ] #Chequeo si se mandó el parametro.
then
	exit 1
fi

conectado=$(who | grep -w "$1" | cut -d " " -f1)
while [ "$conectado" != "$1"  ]
do
	sleep 10
	conectado=$(who | grep -w "$1" | cut -d " " -f1)
done

exit 0
