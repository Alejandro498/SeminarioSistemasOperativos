#!/bin/bash

show_menu() {
    echo "Seleccione una opción:"
    echo "1. Listar el contenido de un fichero (carpeta)"
    echo "2. Crear un archivo de texto con una línea de texto"
    echo "3. Comparar dos archivos de texto"
    echo "4. Mostrar uso del comando awk"
    echo "5. Mostrar uso del comando grep"
    echo "6. Salir"
}

list_content() {
    read -p "Ingrese la ruta absoluta del fichero/carpeta: " path
    if [ -e "$path" ]; then
        ls -l "$path"
    else
        echo "El fichero/carpeta no existe."
    fi
}

create_text_file() {
    read -p "Ingrese el nombre del archivo a crear: " filename
    read -p "Ingrese la cadena de texto a almacenar: " text
    echo "$text" > "$filename"
    echo "Archivo $filename creado con éxito."
}

compare_text_files() {
    read -p "Ingrese la ruta del primer archivo: " file1
    read -p "Ingrese la ruta del segundo archivo: " file2
    if [ -e "$file1" ] && [ -e "$file2" ]; then
        diff "$file1" "$file2"
    else
        echo "Uno o ambos archivos no existen."
    fi
}

show_awk_usage() {
    echo "Uso del comando awk:"
    echo "awk es una herramienta poderosa para el procesamiento de texto y datos."
    echo "Sintaxis básica: awk 'pattern {action}' archivo"
    echo "Ejemplo: Para imprimir la primera columna de un archivo:"
    echo "awk '{print \$1}' test01"
    echo "Ejecutando: awk '{print \$1}' test01"
    awk '{print $1}' test01
}

show_grep_usage() {
    echo "Uso del comando grep:"
    echo "grep se utiliza para buscar patrones dentro de archivos."
    echo "Sintaxis básica: grep 'patrón' archivo"
    echo "Ejemplo: Para buscar la palabra 'Prueba' en un archivo:"
    echo "grep 'Prueba' dsaw"
    echo "Ejecutando: grep 'Prueba' test02"
    grep 'Prueba' test02
}

while true; do
    show_menu
    read -p "Seleccione una opción (1-6): " option
    case $option in
        1) list_content ;;
        2) create_text_file ;;
        3) compare_text_files ;;
        4) show_awk_usage ;;
        5) show_grep_usage ;;
        6) echo "Saliendo..."; exit 0 ;;
        *) echo "Opción no válida." ;;
    esac
    echo ""
done
