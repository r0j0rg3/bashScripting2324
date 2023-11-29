#!/bin/bash
# Este script recibe una acción y un dominio, y muestra info de ese dominio según la opción

# Definimos un array con los 4 modos, SIN comas y ENTRE PARÉNTESIS
modos=("ALIVE" "IP" "DNS" "INFO")

# Comprobamos que hay dos argumentos
if [[ $# -ne 2 ]]; then
	echo "Uso: $0 <MODO> <dominio>"
	echo -e "Introduce uno de estos modos:"
	for modo in ${modos[@]}; do
		echo -e "\t$modo"
	done
else
	# En función del parámetro hacemos una cosa u otra
	if [[ $1 == ${modos[0]} ]]; then
		ping -c 1 $2 > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo -e "Host is up"
		else 
			echo -e "Host is dead"
		fi

	elif [[ $1 == ${modos[1]} ]]; then
		host $2 | grep "has address" | cut -d ' ' -f 4

	elif [[ $1 == ${modos[2]} ]]; then
		dig $2

	elif [[ $1 == ${modos[3]} ]]; then
		whois $(host $2 | grep "has address" | cut -d ' ' -f 4)

	else
		echo -e "ERROR: Modo no válido"
		echo -e "Introduce uno de estos modos:"
		for modo in ${modos[@]}; do
			echo -e "\t$modo"
		done
	fi
fi
