#!/bin/bash

push() {
	if [$# -ne 1]
	then
		echo "Se esperaba 1 parametro." >&2
		return 1
	fi

	pila=("$1" ${pila[*]}) #Esta bien pensarlo como una lista o no hace falta??
}

pop() {
	unset pila[0]
	pila=(${pila[*]})
}

length() {
	echo ${#pila[*]}
	return 0
}

print() {
	echo "${pila[*]}"
}

pila=()

push 1 #Preguntar qué hago aca si tengo un parametro que tiene espacios. Ejemplo: "hola crack". ¿Deberia resolverlo añadiendo los elemtos por posicion del array y no todo junto en el push??

echo "La longitud de la pila antes era de $(length)"
push 2
push 3
push 4
push 5
echo "La longitud de la pila antes era de $(length)"
pop
echo "La longitud de la pila despues es de $(length)"
print

exit 0 #Es implicito??
