#!/bin/bash

recorrido() {
	totalImpares=0
	for numero in ${numeros[*]}
	do
		resto=$(($numero % 2))
		if [ $resto -eq 0  ]
		then
			echo "$numero es un numero par."
		else
			totalImpares=$(($totalImpares + 1))
		fi
	done
	echo "En total hay $totalImpares numeros impares."
	return 0
}

numeros=(1 2 5 4 78 44 53 7)
recorrido

exit 0
