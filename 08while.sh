#!/bin/bash

username=()
gecos=()
home_directory=()
shell=()

echo -e "Leyendo fichero /etc/passwd"

while read lines; do
  # Introduce el campo username en el array
  username+=($(echo $lines | cut -d ":" -f 1))

  # Introduce el campo username en el array
  gecos+=($(echo $lines | cut -d ":" -f 5))

  # Introduce el campo username en el array
  home_directory+=($(echo $lines | cut -d ":" -f 6))

  # Introduce el campo username en el array
  shell+=($(echo $lines | cut -d ":" -f 7))

done < <(cat /etc/passwd)

# Bucle infinito para pedir opciones
while true; do

	# Muestra todas las opciones disponibles
	echo -e "\n Opciones de visualización:"
	echo -e "\t1) Mostrar los nombres de usuario."
	echo -e "\t2) Mostrar el campo GECOS."
	echo -e "\t3) Mostrar el directorio home de cada usuario."
	echo -e "\t4) Mostrar el shell de cada usuario."
	echo -e "\t5) Mostrar toda la información."
	echo -e "\t6) Exit.\n"

	# Recoge la opción introducida por el usuario
	read -p "Selecciona tu opción: " opt

	# Bifurcador en base a la opcion introducida por el usuario
	case $opt in
		1)
			echo -e "\n Hay un total de ${#username[*]} usuarios"
			echo -e "Obteniendo la lista...\n"

			# Recorre el array de usuario
			for username in ${username[@]}
			do
				echo -e "\t$username"
			done
			;;

		2)
			echo -e "\n Hay un total de ${#username[*]} usuarios"
			echo -e "Obteniendo la lista...\n"

			# Recorre el array de gecos
			for geco in ${gecos[@]}
			do
				echo -e "\t$geco"
			done
			;;

		3)
			echo -e "\n Hay un total de ${#username[*]} usuarios"
			echo -e "Obteniendo la lista...\n"

			# Recorre el array de directorios home
			for home in ${home_directory[@]}
			do
				echo -e "\t$home"
			done
			;;

		4)
			echo -e "\n Hay un total de ${#username[*]} usuarios"
			echo -e "Obteniendo la lista...\n"

			# Recorre el array de shell
			for console in ${shell[@]}
			do
				echo -e "\t$console"
			done
			;;

		5) 
			echo -e "\n Hay un total de ${#username[*]} usuarios"
			echo -e "Obteniendo la lista...\n"

			# Recorre el array mediante indices y genera la salida indexando en cada array
			for i in ${!username[@]}
			do
				echo -e "\t${username[$i]}:${gecos[$i]}:${home_directory[$i]}:${shell[$i]}"
			done
			;;

		6)
			# Salida del script
			exit 0 
			;;

		*)
			# Opción default en caso de que no cumple ningun criterio anterior
			echo -e "\n Opción no valida pruebe otra vez"
			;;
	esac
done
