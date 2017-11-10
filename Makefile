tag:=latest
image_name:=xogroup/sumologic-file-collector:$(tag)
namespace?=''
application?=''
collector_name=$(namespace)-k8s-collector
sumo_access_id?=''
sumo_access_key?=''
volumes_from?=''

build:
	IMAGE_NAME=$(image_name) DOCKERFILE=./docker/Dockerfile sh ./docker/scripts/build.sh

run:
	VOLUMES_FROM=$(volumes_from) \
	SUMO_COLLECTOR_NAME=$(collector_name) \
	SUMO_SOURCE_NAME=$(application) \
	SUMO_SOURCE_CATEGORY=container-collector \
	SUMO_ACCESS_ID=$(sumo_access_id) \
	SUMO_ACCESS_KEY=$(sumo_access_key) \
	sh ./docker/scripts/run.sh

kill:
	sh ./docker/scripts/kill.sh

