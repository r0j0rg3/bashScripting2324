#!/bin/bash

modos=("ALIVE" "IP" "DNS" "INFO")

if [[ $# -ne 1 ]]; then
	echo "Uso: $0 <dominio>"
else 
	dominio=$1
	while true; do

		for i in ${!modos[@]}; do
			echo -e "\t$(($i+1)). ${modos[$i]}"
		done

		# Pedimos al usuario que introduzca la acción a realizar
		read -p "Introduce el modo que deseas: " opcion

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
				echo -n "La ip es "
				host $dominio | grep "has address" | cut -d ' ' -f 4
				;;
			3)
				dig $dominio
				;;
			4)
				direccion=$(host $dominio | grep "has address" | cut -d ' ' -f 4)
				if [ -n "$direccion" ]; then
					whois $direccion
				else
					echo "No se pudo obtener la dirección IP del dominio."
				fi
				;;
			*)
				echo "Opción inválida. Elige una opción válida (1-${#modos[*]})."
				;;
		esac
		echo ""
	done
fi
