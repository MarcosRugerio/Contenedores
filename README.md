# Contenedores
Apuntes sobre contenedores, aplican para Podman y Docker.

- Aquí podrás consultar la lista de comandos para usar [Podman](https://docs.podman.io/en/latest/Commands.html) y [Docker](https://docs.docker.com/reference/).
## Comandos básicos
Estos comandos son los básicos para cononocer imagenes, contenedores corriendo, etc.

- `podman images` - visualiza las imagenes en el equipo local

- `podman image` - 

`- podman ps` - visualiza las images corriendo

- `podman ps -a` - muestra los contenedores corriendo

- `code`
## Eliminar contenedores
Antes de eliminar un contenedor se debe estar seguro que no este corriendo

- `podman container rm []`
## Iniciar contenedores
- `code`

## Ejecutar comandos dentro de un contenedor
- `code`

## Volumenes
Comandos para crear volumenes y mapearlos con contenedores.

- `podman volumen ls`: Consultar volumenes creados

```
~$ podman volume ls
DRIVER      VOLUME NAME
local       dac5f27e10f8c791f864170d4030b500450081557ac5f8f9a218dbb9662b35e0
local       local
```

- `podman `

- `podman volumen inspect [NombreVolumen]`: Sirve para consultar detalles del volumen creado como lo son: name, driver, mountpoint.

```
~$ podman volumen inspect local
[
     {
          "Name": "local",
          "Driver": "local",
          "Mountpoint": "/home/marcosrugerio/.local/share/containers/storage/volumes/local/_data",
          "CreatedAt": "2022-11-16T17:22:10.904595809-06:00",
          "Labels": {},
          "Scope": "local",
          "Options": {},
          "MountCount": 0,
          "NeedsCopyUp": true
     }
]
```

- Compartir un folder local dentro de un contenedor
```
~$ podman container run -it -v local:/src ubuntu
root@e10f10011a10:/# ls /src 
PODMAN  a  b  c
  ```

- Usar un archivo local y publicarlo en un contenedor
```
~$ podman container run -d -v ~/Documents/NGINX/index.html:/usr/share/nginx/html/index.html -p 80:80 nginx
```
