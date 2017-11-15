tag=1.0.0
repository:=xogroup/sumologic-file-collector
tagged_image:=$(repository):$(tag)
image_name:=$(repository):latest
namespace?=''
application?=''
collector_name=$(namespace)-k8s-collector
sumo_access_id?=''
sumo_access_key?=''
volumes_from?=''

build:
	IMAGE_NAME=$(image_name) DOCKERFILE=./docker/Dockerfile sh ./docker/scripts/build.sh

tag:
	IMAGE_NAME=$(image_name) TAGGED_IMAGE=$(tagged_image) ./docker/scripts/tag.sh

push:
	TAGGED_IMAGE=$(tagged_image) ./docker/scripts/push.sh

start:
	VOLUMES_FROM=$(volumes_from) \
	SUMO_COLLECTOR_NAME=$(collector_name) \
	SUMO_SOURCE_NAME=$(application) \
	SUMO_SOURCE_CATEGORY=container-collector \
	SUMO_ACCESS_ID=$(sumo_access_id) \
	SUMO_ACCESS_KEY=$(sumo_access_key) \
	sh ./docker/scripts/start.sh

kill:
	sh ./docker/scripts/kill.sh

