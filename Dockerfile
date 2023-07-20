# indicamos que necesitamos una imagen base de python3.11
FROM python:3.11.4-slim-bullseye

# instalamos las dependencias necesarias para construir mysqlclient
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# copiamos el código en el directorio
COPY . /code

# exponemos el puerto que vamos a usar
EXPOSE 8000

# indicamos el directorio donde vamos a trabajar
WORKDIR /code

# instalamos dependencias necesarias para el proyecto
RUN pip install -r /code/requirements.txt

# arrancamos el servidor
# CMD python backend/manage.py runserver 0.0.0.0:8000
CMD ["gunicorn", "--bind" ,"0.0.0.0:8000", "basicserver.wsgi"]
