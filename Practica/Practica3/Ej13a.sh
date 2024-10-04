#!/bin/bash

for i in {1..100}
do
	echo "El numero es $i y su cuadrado es $(( $i * $i ))"
done

read final

for ((i=1; i < $final; i++))
do
	echo "El numero es $i y su cuadrado es $(( $i * $i ))"
done
exit 0
