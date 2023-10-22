# Not Only Cloud Data Stack

## Requirements
- docker
- shell

## Components

Data warehouse: Clickhouse (Done)

Orchestrator: Mage (Done)

Datalake: Minio (Done)

Dataviz: Apache Superset (In progress)

Data science: JupyterLab (TODO)


## Run the components
```sh
$ cp .env.template .env && vim .env # set your env values
$ cp ./superset/$SUPERSET_ENV/.env.template ./superset/$SUPERSET_ENV/.env # edit superset env depending on the value of SUPERSET_ENV values in the previous .env
$ docker compose config # verify your final compose file
$ docker compose up -d
```

> Note: the folder ./superset/docker is copied from https://github.com/apache/superset/tree/master/docker

## Have Fun!
Clickhouse: http://localhost:8123/play

Mage: http://localhost:6789/pipelines

Minio: http://localhost:9090/login

Superset: http://localhost:8088/login/
