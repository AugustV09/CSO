#!/bin/bash

verArchivo() {
	for archivo in ${array[*]}
	do
		nombre=$(basename ${archivo}) #Debo buscar en base al BASENAME o en base al PATH????
		if [ $nombre = $1 ]
		then
			echo "El archivo es $archivo"
			return 0 #Esta bien que retorne el 0 si todo salio bien???
		fi
	done

	echo "Archivo no encontrado"
	return 5
}

cantidadArchivos() {
	echo "La cantidad de archivos de /home con terminación .doc es de ${#array[*]}"
	return 0
}

borrarArchivo() {
	encontrado=false
	posicion=0
	for archivo in ${array[*]}
	do
		nombre=$(basename ${archivo})
		if [ "$nombre" = "$1" ]
		then
			archivoAux="$archivo" #Es necesario guardarme el PATH??? Conceptualmente esta bien esto (pregunto porque las variables en Bash son todas globales pero en alto nivel esto esta mal) ???
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
		unset array[$posicion]
		array=${array[*]}
		if [ $eleccion = No ]
		then
			rm "$archivoAux"
		fi
		break
	done

	return 0
}



array=()

for archivo in /home/*.doc
do
	if [ -f "$archivo" ]
	then
		array+=("$archivo") #Hay que incluir el BASENAME de los archivos en el arreglo o todo el PATH????
	fi
done

cantidadArchivos
borrarArchivo pepe.doc
echo "$?"
exit 0
