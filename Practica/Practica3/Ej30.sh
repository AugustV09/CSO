#!/bin/bash

dir="${HOME}/bin/"

if [ ! -d "$dir" ]
then
	mkdir "$dir"
fi

cant_movidos=0

for programa in ./*
do
	if [ -x "$programa" ]
	then
		mv "$programa" "$dir"
		let cant_movidos++
		nombre=$(basename "$programa")
		echo "Se ha movido el archivo ejecutable del directorio actual de nombre $nombre"
	fi
done

echo "Se han movido ${cant_movidos} archivos ejecutables"
