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

## Puertos
Nos permite exponer/mapear puertos de nuestro localhost con nuestro contenedores. Sirve para poder acceder a recursos dentro de nuestros contenedores.

`podman container run -d -p [LocalhostPort]:[ContainerPort] [image]`

```
~$ podman container run -d -p 1984:80 niginx
~$ curl localhost:1984
<h1>Hola</h1>
```
## Volumenes
Comandos para crear volumenes y mapearlos con contenedores.

- `podman volume ls`: Consultar volumenes creados

```
~$ podman volume ls
DRIVER      VOLUME NAME
local       dac5f27e10f8c791f864170d4030b500450081557ac5f8f9a218dbb9662b35e0
local       local
```

- `podman volume create [nombre]`
```
~$ podman volume create nuevoVol
nuevoVol
```
Para conocer los detalles del volumen creado, como son name, driver, mountpoint se usa el comando __inspect__.
- `podman volumen inspect [NombreVolumen]`
```
~$ podman volumen inspect nuevoVol
[
     {
          "Name": "nuevoVol",
          "Driver": "local",
          "Mountpoint": "/home/user/.local/share/containers/storage/volumes/nuevoVol/_data",
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
~$ podman container run -it -v nuevoVol:/src ubuntu
root@e10f10011a10:/# ls /src 
PODMAN  a  b  c
  ```

- Tambien es posible compartir un archivo local y publicarlo dentro de un contenedor
```
~$ podman container run -d -v ~/Documents/NGINX/index.html:/usr/share/nginx/html/index.html -p 1981:80 nginx
```

## Imagenes
Es posible crear imagenes directamente desde un arcihvo llamado Containerfile/Dockerfile (Podman/Docker respectivamente.)


```
~$ vim Containerfile
     FROM ubuntu
     RUN mkdir /app
     RUN cd /app && touch data.txt
~$ podman image build -t ubuntu-podman .
STEP 1/3: FROM ubuntu
STEP 2/3: RUN mkdir /app
--> ae2f763923b
STEP 3/3: RUN cd /app && touch data.txt
COMMIT ubuntu-podman
--> 3c24c29d2e1
Successfully tagged localhost/ubuntu-podman:latest
3c24c29d2e1cb0c4a9dc361d1a83882ecdb58e08fb61444ba65917808dc43d92
```

Al revisar las imagenes podremos ver la nuestra imagen creada:
```
~$ podman image ls
REPOSITORY                             TAG         IMAGE ID      CREATED         SIZE
localhost/ubuntu-podman                latest      3c24c29d2e1c  10 minutes ago  80.3 MB
```

