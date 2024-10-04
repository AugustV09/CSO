#!/bin/bash

if [ $# -ne 3 ]
then
	exit 1
fi

echo "El resultado de hacer la operacion $1 $2 $3 es: $(( $1 $2 $3 ))"
