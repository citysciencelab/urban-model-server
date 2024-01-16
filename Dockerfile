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

ENV PYGEOAPI_CONFIG=config-dev.yml
ENV PYGEOAPI_OPENAPI=example-openapi.yml

RUN pygeoapi openapi generate $PYGEOAPI_CONFIG > PYGEOAPI_OPENAPI

EXPOSE 5555

CMD [ "gunicorn", "--worker-class", "eventlet", "-w", "1", "--bind", "0.0.0.0:5555", "pygeoapi.flask_app:APP", "--log-level", "debug" ]