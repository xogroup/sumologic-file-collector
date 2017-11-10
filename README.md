# Dockerized Sumologic File Collector

Sumologic log file collector with dockerization based on original [sumologic repo](https://github.com/SumoLogic/sumologic-collector-docker)

Will grab specified logfiles and continuously push to sumo collector

Many configuration options available

## Prerequisites

You must have [Docker](https://www.docker.com/) and [Make](https://www.gnu.org/software/make/manual/make.html) (`brew install make`)

## Install

Clone this repo. Then run:

```bash
make build
```

which will build the docker image `xogroup/sumologic-file-collector:latest`

## Usage

Run the image on a container, preferably on detached mode.

see example under `./docker/scripts/run.sh`

It will capture all changes to specified log files and push them to sumologic.

You must pass these config values via env variables:


| Variable                    |Description                                                          |
|-----------------------------|---------------------------------------------------------------------|
|SUMO_ACCESS_ID               | Your Sumologic access ID                                            |
|SUMO_ACCESS_KEY              | Your Sumologic access key                                           |
|SUMO_COLLECTOR_NAME          | Name of collector for this source. Will create if it doesn't exist. |
|SUMO_SOURCE_NAME             | Name of the source (tipically associated with app name              |
|SUMO_SOURCE_CATEGORY         | Type of source (eg: file-log-collector)                             |


You can also check the Make commands as examples 

### Log files locations

For now, it will collect logs from the /tmp/clogs directory in the container. 
Configuration for this path and possible docker volume mounting, will be added later.

### Build docker image

```bash
make build
```

### Run collector on background

```bash
make run namespace=babytechj application=qa-avatars-api sumo_access_key={your_key} sumo_access_secret={your_secret}
```

### Stop collector

```bash
make kill
```