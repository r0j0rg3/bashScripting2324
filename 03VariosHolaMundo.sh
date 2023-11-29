#!/bin/bash

# $# Número de argumentos
echo -e "Has introducido $# nombres."

# Recorremos la lista imprimiendo todos los argumentos
if [ $# -eq 0 ]; then
    echo -e "No has introducido parámetros"
	echo -e "Uso: $0 <nombre1> [... nombreN]"

else
    # $@ Todos los argumentos (Como strings separadas)
    echo -e "La lista de argumentos es $@."

    for nombre in "$@"; do
        echo "¡Hola, $nombre!"
    done

fi
