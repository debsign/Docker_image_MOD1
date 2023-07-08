# indicamos que necesitamos una imagen base de python3.11
FROM python:3.11.4-slim-bullseye
# copiamos el código en el directorio
COPY . /code
# exponemos el puerto que vamos a usar
EXPOSE 8000
# indicamos el directorio donde vamos a trabajar
WORKDIR /code
# instalamos dependencias necesarias para el proyecto
RUN pip install -r /code/requirements.txt
# arrancamos el servidor
CMD python backend/manage.py runserver 0.0.0.0:8000