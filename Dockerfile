FROM ubuntu:20.04

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

COPY . /app

RUN python3 setup.py install

ENV PYGEOAPI_CONFIG=config-prod.yml

RUN pygeoapi openapi generate $PYGEOAPI_CONFIG > example-openapi.yml

EXPOSE 5555

CMD [ "gunicorn", "--worker-class", "eventlet", "-w", "4", "--bind", "0.0.0.0:5555", "pygeoapi.flask_app:SOCKETAPP" ]