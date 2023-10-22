# Not Only Cloud Data Stack

## Requirements
- docker
- shell

## Components

Data warehouse: Clickhouse (Done)

Orchestrator: Mage (Done)

Datalake: Minio (TODO)

Dataviz: Apache Superset (TODO)

Data science: JupyterLab (TODO)


## Run
```sh
$ cp .env.template .env && vim .env # set your env values
$ docker compose config # verify your final compose file
$ docker compose up -d
``