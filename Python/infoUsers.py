import os
import cpuinfo

if os.geteuid() != 0:
    print("Error, esto debe ser ejecutado como root")
    exit()
else:
    while True:
        print("1.Mostrar información del sistema y de la CPU")
        print("2.Gestionar usuario")
        print("3.Gestionar directorio")
        print("4.Salir")
        opt=int(input("Introduce una opción: "))

        match opt:
            case 1:
                print("Mi SSOO es",os.uname().sysname)
                print("Mi procesador es ",cpuinfo.get_cpu_info()["brand_raw"])

            case 2:
                nom_usuario=input("Ingrese un nombre de usuario: ")
                fich=open("/etc/passwd","r")
                cont=fich.readlines()
                enc=0
                for i in cont:
                    if i.split(":")[0] == nom_usuario:
                        print(i)
                        enc = 1
                        break
                if enc == 1:
                    print("Usuario encontrado")
                else:
                    print("Usuario no encontrado, creando...")
                    os.system("useradd " + nom_usuario)
                    print("Usuario creado")

            case 3:
                nom_directorio=input("Introduzca un nombre de directorio: ")
                if os.path.isdir(nom_directorio):
                    print("Su directorio", nom_directorio, "ya existe")
                else:
                    print("Su directorio no existe, se va a proceder a crearlo")
                    os.mkdir(nom_directorio)
                    print("El directorio",nom_directorio,"se ha creado correctamente")

            case 4:
                print("Adiós")
                break

