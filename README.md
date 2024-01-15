![Urban Model Server_Banner](https://github.com/citysciencelab/urban-model-server/assets/61881523/e9df4caa-0bc2-42b9-a786-1e73d97337bf)

# Urban Model Server
This is a modified instance of the [pygeoapi](https://pygeoapi.io) that can act as a server to host various urban models. It extends the functionalities of the pygeopai with a Websocket implementation. Different microservices/processes can connect with the pygeoapi via Websockets. The processes are then dynamically stored in the Urban Model Server instance and can be executed under the specific  ```/processes/<process-id>/execution``` endpoint. A job ID is created as usual and once the calculations are finished, the results are transferred back from the Microservices and stored under the ```/jobs/<job-id>/results``` endpoint.

It is thus possible to connect multiple processing microservices with the Urban Model Server as long as the ```SOCKETAPP``` CORS settings allow for it. The microservices can be written in different programming languages and Dockerized environments with their respective packages. Dependency conflicts can thus be resolved. 

The architecture of the Urban Model Server looks as following:

![Urban Model Server Architektur](https://github.com/citysciencelab/urban-model-server/assets/61881523/a2c7f114-913a-4aaf-b153-97b6d16f1765)

## Development Setup
To start the pygeoapi in local development mode, follow these steps

1. Create a virtual environment in Python with ```python3 -m venv urbanmodelserver```
1. Navigate to the new environment with ```cd urbanmodelserver``` and activate it with ```. bin/activate```
1. Clone or download this repository
1. Navigate into the repository with ```cd urban-model-server``` and install the requirements with ```pip3 install --upgrade pip``` and ```pip3 install -r requirements.txt ```
1. Run the Setup file with ```python3 setup.py install```
1. Adjust the [config-dev.yml](./config-dev.yml) file as necessary
1. Set the environment variables with ```export PYGEOAPI_CONFIG=config-dev.yml``` and ```export PYGEOAPI_OPENAPI=example-openapi.yml```
1. Generate the openapi config file by running ```pygeoapi openapi generate $PYGEOAPI_CONFIG > $PYGEOAPI_OPENAPI```
1. To start the development setup, run ```pygeoapi serve```

## Production Setup
Make sure to have Docker and Docker Compose installed, adjust the production settings in the [config-prod.yml](./config-prod.yml) file and simply run ```docker-compose up```. 

> ⚠️ The current version of the Urban Model Server is still a prototype. If you want to use it in production, please carefully check for any possible security concerns.



## pygeoapi

[![DOI](https://zenodo.org/badge/121585259.svg)](https://zenodo.org/badge/latestdoi/121585259)
[![Build](https://github.com/geopython/pygeoapi/actions/workflows/main.yml/badge.svg)](https://github.com/geopython/pygeoapi/actions/workflows/main.yml)
[![Docker](https://github.com/geopython/pygeoapi/actions/workflows/containers.yml/badge.svg)](https://github.com/geopython/pygeoapi/actions/workflows/containers.yml)
[![Vulnerabilities](https://github.com/geopython/pygeoapi/actions/workflows/vulnerabilities.yml/badge.svg)](https://github.com/geopython/pygeoapi/actions/workflows/vulnerabilities.yml)

[pygeoapi](https://pygeoapi.io) is a Python server implementation of the [OGC API](https://ogcapi.ogc.org) suite of standards. The project emerged as part of the next generation OGC API efforts in 2018 and provides the capability for organizations to deploy a RESTful OGC API endpoint using OpenAPI, GeoJSON, and HTML. pygeoapi is [open source](https://opensource.org/) and released under an [MIT license](https://github.com/geopython/pygeoapi/blob/master/LICENSE.md).

Please read the docs at [https://docs.pygeoapi.io](https://docs.pygeoapi.io) for more information.
