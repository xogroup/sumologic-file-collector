#!/usr/bin/env bash

docker run --volumes-from $VOLUMES_FROM \
  -d --name="sumo-logic-collector"  \
  -e SUMO_COLLECTOR_NAME=$SUMO_COLLECTOR_NAME  \
  -e SUMO_SOURCE_NAME=$SUMO_SOURCE_NAME \
  -e SUMO_SOURCE_CATEGORY=$SUMO_SOURCE_CATEGORY \
  -e SUMO_ACCESS_ID=$SUMO_ACCESS_ID \
  -e SUMO_ACCESS_KEY=$SUMO_ACCESS_KEY \
  xogroup/sumologic-file-collector:latest