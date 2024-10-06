#!/bin/bash

arreglo1=(1 2 3 4 5)
arreglo2=(6 7 8 9 10)

for ((i=0; i < ${#arreglo1[*]}; i++))
do
	echo "La suma de los elementos de la posicion $i de los vectores es $((${arreglo1[${i}]} + ${arreglo2[${i}]}))"	
done

exit 0
