#!/bin/bash

# Crear un archivo de texto llamado mytext con la cadena "Hola Mundo"
echo "Creando el archivo mytet con el texto 'Hola Mundo'"
echo "Hola Mundo" > mytext

echo "Mostrando el contenido de mytext:"
# Desplegar el contenido del archivo mytext
cat mytext

# Crear un directorio llamado backup
echo "Creando el directorio backup"
mkdir -p backup

# Mover el archivo mytext al directorio backup
echo "Moviendo mytext al directorio backup"
mv mytext backup/

#Listar el contenido del direcotio backup
echo "Listando el contenido del direcotrio backup:"
ls -l backup

#Eliminar el archivo mytext dentro del directorio backup
echo "Eliminando el archivo mytext dentro de backup"
rm backup/mytext

# Eliminar el directorio backup
echo "Eliminando el directorio backup"
rmdir backup
