#!/bin/bash

if [ $# -ne 1  ]
then
	echo "No se cumplen los requisitos."
	exit 1
fi

reporte="reporte.txt"

echo "Nombre de Usuario                   | Cantidad de archivos con la extension $1" > "$reporte"
echo "------------------------------------------------------------------------------" >> "$reporte"

cantidad=$(find $HOME -type f -name "*.$1" 2> /dev/null | wc -l)

echo "$(whoami)                           | $cantidad" >> "$reporte"

exit 0
