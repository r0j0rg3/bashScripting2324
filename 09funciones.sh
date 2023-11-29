#!/bin/bash

# $#    Number of arguments
# $*    All positional arguments (as a single word)
# $@    All positional arguments (as separate strings)
# $1    First argument
# $_    Last argument of the previous command

if [ $# -ne 2 ]; then
        echo -e "Introduce 2 numeros"
        exit 1
fi

numero1=$1
numero2=$2

#FUncion simple
funcSimple() {
        echo "Soy una funcion simple"
}

#Funcion parametros globales y de llamada
funcParametros() {
        echo "Los numeros introducidos son $numero1 y $numero2"
        echo -e "El valor del parametro 1 es de $1 \nEl valor del parametro 2 es de $2" 
}

#Funcion retorno variable local
funcLocal() {
        local suma=$(($numero1+$numero2))
        echo "$suma"
}

#Funcion retorno con return
funcRetorno2() {
        #si id devuelve un usuario entonces devuelve 0 
        if id "$1" >/dev/null 2>&1; then
                #si grep devuelve un valor, entonces devuelve 0
                # -q permite no mostrar la saldia del grep
                if groups "$1" | grep -q 'sudo'; then
                        return 0
                elif groups "$1" | grep -q 'wheel'; then
                        return 0
                else 
                        return 1
                fi
        else
                return 2        
        fi
}

funcParametroRetornado() {
        #llamamos a la funcion funcRetorno2
        funcRetorno2 "$1"
        #obtenemos el valor de la utima funcion/comando ejecutado
        case $? in
                0)
                        echo "el usuario $1 tiene permisos de administrador"
                ;;
                1)
                        echo "El usuario $1 no tiene permisos de administrador"
                ;;
                *)
                        echo "El usuario $1 no existe en el sistema"
                ;;
                esac
}
 
#Funcion completa
comprobarClave() {
        #${#1} obtiene la longitud de la cadena
        if [ "${#1}" -lt 10  ]; then 
                echo "La clave '$1' no cumple la longitud minima"
        elif  echo "$1" | grep -q '[0-9]' && echo "$1" | grep -q '[a-zA-Z]' && echo "$1" | grep -q '[@#\$%^\&*()_+\?¿¡\!]'; then
                echo "La clave '$1' es segura"
        else
                echo "La clave '$1' no cumple con los parametros de seguridad"
        fi
}
 
#Llamamos a las funciones tras ser creadas

#Funcion 1
funcSimple

#Funcion 2
funcParametros 1 "Uno"

#Funcion 3
echo "La suma local es $(funcLocal)"


#Funcion 5
read -p "Ingresa un usuario: " nombreUsuario

funcParametroRetornado "$nombreUsuario"

#Funcion 6
# -s permite ocultar el valor de la entrada del usuario a tiempo real
read -s -p "Ingresa una clave: " claveUsuario
echo
comprobarClave "$claveUsuario"
