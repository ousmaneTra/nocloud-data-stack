# Not Only Cloud Data Stack

## Requirements
- docker
- Linux shell (you can WSL/Debian on Windows)
- make

## Components

Data warehouse: Clickhouse  
Data integration, orchestrator: Mage  
Datalake: Minio  
Dataviz: Apache Superset  
Data Exploration/Science: JupyterLab


## Configurations

### Set env variables : carrefully choose sensitive ones
```sh
$ cp .env.template .env && vim .env # set your env values
$ make .env.make && source .env.make # load env into current shell
$ cp ./superset/$STACK_ENV/.env.template ./superset/$STACK_ENV/.env && vim ./superset/$STACK_ENV/.env # edit superset env
```
### Volumes: in production, recommanded to store data on different disks
```sh
$ cp volumes.template.yaml volumes-$STACK_ENV.yaml
$ edit volumes-$STACK_ENV.yaml # set 'device' path on volumes
```

### Verify configurations final_compose.yaml
```sh
$ make verify # then open final_compose.yaml to verify
```

## Run the stack
```sh
$ make # or make start :)
```

## stop the stack
```sh
$ make stop
```

> Note: the folder ./superset/docker is copied from https://github.com/apache/superset/tree/master/docker

## Have Fun!
Clickhouse: http://localhost:8123/play

Mage: http://localhost:6789/pipelines

Minio: http://localhost:9090/login

Superset: http://localhost:8088/login/

JupyterLab: http://localhost:8888/ (get the token from Docker, in container logs)
