#!/bin/bash
read num1 num2

echo $(( $num1 * $num2 ))
echo $(( $num1 + $num2 ))
echo $(( $num1 - $num2 ))

if [ $num1 -gt $num2 ]
then
	echo "${num1} es mayor que ${num2}"
elif [ $num2 -gt $num1 ]
then
	echo "${num2} es mayor que ${num1}"
else
	echo "Los numeros son iguales"
fi

exit 0
