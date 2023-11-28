#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Uso: ./06InfoFile.sh <archivo>"
else
	if ! [[ -e $1 ]]; then
		echo -e "$1 no encontrado."
	else
		echo "Tipo de archivo: "
		[[ -d $1 ]] && echo -e "\t es un directorio"
		[[ -f $1 ]] && echo -e "\t es un fichero"
		[[ -h $1 ]] && echo -e "\t es un enlace simbólico"

		echo "Permisos de archivo: "
		[[ -r $1 ]] && echo -e "\t es legible"
		[[ -w $1 ]] && echo -e "\t es escriturable"
		[[ -x $1 ]] && echo -e "\t es ejecutable"
	fi
fi

