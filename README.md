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

- `podman volumen`

Usar un archivo local y publicarlo en un contenedor

- `podman container run -d -v ~/Documents/NGINX/index.html:/usr/share/nginx/html/index.html -p 80:80 nginx`
