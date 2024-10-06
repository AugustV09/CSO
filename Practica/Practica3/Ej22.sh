#!/bin/bash

productoria(){
	producto=1
	for ((i=0; i < ${#num[*]}; i++)) #Lo hice de esta forma para probar pero es mejor con el otro uso del for
	do
		producto=$(( $producto * ${num[${i}]} ))
	done
	echo $producto
	return 0
}

num=(10 3 5 7 9 3 5 4)

productoria

exit 0
