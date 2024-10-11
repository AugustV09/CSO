#!/bin/bash

verArchivo() {
	#Supongo que $1 viene con el nombre base del archivo

	if [ $# -eq 1] && [ -f "$1" ]
	then
		for archivo in ${array[*]}
		do
			if [ "$archivo" = "$1" ] #No uso basename acá porque añadí los archivos al array estando posicionado en el directorio HOME (por ende solo me quede con el nombre de los archivos)
			then
				echo "$archivo"
				return 0 #Esta bien que retorne el 0 si todo salio bien???
			fi
		done
	fi
	

	echo "Archivo no encontrado"
	return 5
}

cantidadArchivos() {
	echo ${#array[*]}
}

borrarArchivo() {

	if [ $# -eq 1] && [ -f "$1" ]
	then
		encontrado=false
		posicion=0
		for archivo in ${array[*]}
		do
			if [ "$archivo" = "$1" ] #No uso basename acá porque añadí los archivos al array estando posicionado en el directorio HOME (por ende solo me quede con el nombre de los archivos)
			then
				encontrado=true
				break
			fi
			let posicion++
		done

		if [ $encontrado = "false" ]
		then
			echo "Archivo no encontrado"
			return 10
		fi

		echo "Desea borrar el archivo logicamente:"
		select eleccion in Si No
		do
			archivoAux="${array[${posicion}]}"
			unset array[$posicion]
			array=(${array[*]})
			if [ $eleccion = No ]
			then
				rm "archivoAux"
			fi
			break
		done
		return 0
	fi
	
	echo "Archivo no encontrado"
	return 10
}



array=()
pushd /home/

for archivo in *.doc
do
	if [ -f "$archivo" ]
	then
		array+=("$archivo") #Hay que incluir el BASENAME de los archivos en el arreglo o todo el PATH (Pregunto por si hace falta el pushd o no) ????
	fi
done

cantidadArchivos
borrarArchivo pepe.doc

popd
exit 0 #Es implicito??
