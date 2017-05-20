# Docker setup para desarrollo

1. Construir la imagen: `docker build . -t indexador`
1. Correr el container: `docker run  -i -t --rm -p 3030:3000 --env 'MONGODB_HOST=<IP asignado a interfaz docker0>:27017' indexador`
