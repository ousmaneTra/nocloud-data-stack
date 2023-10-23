# Not Only Cloud Data Stack

## Requirements
- docker
- shell

## Components

Data warehouse: Clickhouse  
Data integration, orchestrator: Mage  
Datalake: Minio  
Dataviz: Apache Superset  
Data Exploration/Science: JupyterLab


## Configure and run the stack
```sh
$ cp .env.template .env && vim .env # set your env values
$ cp ./superset/$SUPERSET_ENV/.env.template ./superset/$SUPERSET_ENV/.env # edit superset env depending on the value of SUPERSET_ENV values in the previous .env
$ ./superset-build-image.sh # build "custom-superset" image with dependencies from superset/requirements.txt
$ docker compose config # verify your final compose file
$ docker compose up -d
```

> Note: the folder ./superset/docker is copied from https://github.com/apache/superset/tree/master/docker

## Have Fun!
Clickhouse: http://localhost:8123/play

Mage: http://localhost:6789/pipelines

Minio: http://localhost:9090/login

Superset: http://localhost:8088/login/

JupyterLab: http://localhost:8888/ (get the token from Docker, in container logs)
