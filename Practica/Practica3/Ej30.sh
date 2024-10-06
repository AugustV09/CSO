#!/bin/bash

if [ ! -d "$HOME/bin" ]
then
	mkdir $HOME/bin
fi

cant_movidos=0

for programa in ./*
do
	if [ -x "$programa" ]
	then
		mv "$programa" "${HOME}/bin/"
		let cant_movidos++
		nombre=$(basename "$programa")
		echo "Se ha movido el archivo ejecutable del directorio actual de nombre $nombre"
	fi
done

echo "Se han movido ${cant_movidos} archivos ejecutables"
exit 0
