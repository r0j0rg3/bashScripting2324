#!/bin/bash

modos=("ALIVE" "IP" "DNS" "INFO")

if [[ $# -ne 1 ]]; then
	echo "Uso: ./06InfoFile.sh <dominio>"
else 
	dominio=$1
	while true; do

		# Imrpimimos el menú de opciones
		i=1
		echo "Selecciona un modo:"
		for modo in ${modos[@]}; do
			echo -e "\t$i. $modo"
			i=$(($i+1))
		done

		# Pedimos al usuario que introduzca la acción a realizar
		read -p "Introduce el número correspondiente al modo que deseas: " opcion

		# En función de la entrada, ejecutamos un modo u otro
		case $opcion in
			1)
				ping -c 1 $dominio > /dev/null 2>&1
				if [ $? -eq 0 ]; then
					echo -e "Host is up"
				else
					echo -e "Host is dead"
				fi
				;;
			2)
				read -p "Introduce el dominio: " dominio
				host $dominio | grep "has address" | cut -d ' ' -f 4
				;;
			3)
				read -p "Introduce el dominio: " dominio
				dig $dominio
				;;
			4)
				read -p "Introduce el dominio: " dominio
				direccion=$(host $dominio | grep "has address" | cut -d ' ' -f 4)
				if [ -n "$direccion" ]; then
					whois $direccion
				else
					echo "No se pudo obtener la dirección IP del dominio."
				fi
				;;
			5)
				echo "Saliendo del programa."
				exit 0
				;;
			*)
				echo "Opción inválida. Por favor, elige una opción válida (1-5)."
				;;
		esac
	done
fi
