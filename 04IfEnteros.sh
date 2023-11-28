#!/bin/bash

# [[ NUM -eq NUM ]] 	Equal
# [[ NUM -ne NUM ]] 	Not equal
# [[ NUM -lt NUM ]] 	Less than
# [[ NUM -le NUM ]] 	Less than or equal
# [[ NUM -gt NUM ]] 	Greater than
# [[ NUM -ge NUM ]] 	Greater than or equal


# Comprobamos que ha introducido 2 argumentos
if [[ $# -ne 2 ]]; then
	echo -e "Introduce 2 números"

else
	# Comparamos si son iguales 
	if [[ $1 -eq $2 ]]; then
		echo -e "$1 y $2 son el mismo número."

	else
		# Comprobamos si el primero es mayor al segundo, en ese caso damos la diferencia
		if [[ $1 -gt $2 ]]; then
			echo -e "$1 es $(($1-$2)) unidades mayor que $2."
		# Comprobamos si el segundo es mayor al primero, en ese caso damos la diferencia
		else
			echo -e "$2 es $(($2-$1)) unidades mayor que $1."
		fi
	fi
fi

