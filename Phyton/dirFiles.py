import os
import shutil

ficheros = []
directorios = []
file = open("rutas.txt", 'r')
for linea in file:
    ruta = linea.strip()
    if os.path.isfile(ruta):
        ficheros.append(ruta)
    elif os.path.isdir(ruta):
        directorios.append(ruta)
file.close()

while True:
    print("Menú de opciones:")
    print("A - Eliminar fichero")
    print("B - Información de directorio")
    print("C - Copiar fichero")
    print("D - Mostrar lista")
    print("E - Salir")
    opcion = input("Seleccione una opción: ").strip().upper()

    match opcion:
        case 'A':
            nombre = input("Ingrese el nombre del fichero a eliminar: ")
            if os.path.isfile(nombre):
                os.remove(nombre)
                print("Fichero eliminado.")
            else:
                print("El fichero no existe.")

        case 'B':
            nombre = input("Ingrese el nombre del directorio: ")
            if os.path.isdir(nombre):
                print("Contenido:", os.listdir(nombre))
            else:
                print("Noo existe.")

        case 'C':
            origen = input("Ingrese el nombre del fichero a copiar: ")
            destino = input("Ingrese la ruta de destino: ")
            if os.path.isfile(origen):
                shutil.copy(origen, destino)
                print("Fichero copiado con éxito.")
            else:
                print("El fichero no existe.")

        case 'D':
            eleccion = input("¿Mostrar (F)icheros o (D)irectorios?: ").strip().upper()
            if eleccion == 'F':
                print("Lista ficheros:", ficheros)
            elif eleccion == 'D':
                print("Lista de directorios:", directorios)
            else:
                print("Opción no válida")

        case 'E':
            print("Saliendo")
            break

        case _:
            print("Opción inválida, intente de nuevo.")