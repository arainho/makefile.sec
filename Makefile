
SHELL = /bin/bash


# VARIABLES
RESULTS_FOLDER ?= "results/"

## secret detection
TRUFFLEHOG_ENTROPY ?= False
TRUFFLEHOG_RESULTS ?= $(RESULTS_FOLDER)
TRUFFLEHOG_REPORT ?= trufflehog_report.json
SHHGIT_RESULTS ?= $(RESULTS_FOLDER)
SHHGIT_CONFIG_FILE ?= "config.yaml"

## container scanning
REGISTRY ?= docker.io
IMAGE_NAME ?= alpine
IMAGE_TAG ?= latest


# CONTAINER SCANNING
container_scanning: audit_grype

audit_grype:
	${GRYPE} -f critical ${REGISTRY}/${IMAGE_NAME}:${IMAGE_TAG}

# SECRET DETECTION
secret_detection: audit_trufflehog audit_shhgit

audit_trufflehog:
  docker run \
       -t \
       --rm \
       -v $(PWD):/target dxa4481/trufflehog \
       --max_depth=20 \
       --json \
       --regex \
       --entropy=$(TRUFFLEHOG_ENTROPY) \
       file:///target | tee trufflehog_report.json | jq -C
 
 audi_shhgit_prepare:
	rm -f -- "${PWD}/${SHHGIT_RESULTS}"
	rm -f -- "${SHHGIT_CONFIG_FILE}"
	curl https://raw.githubusercontent.com/eth0izzle/shhgit/master/config.yaml -o "${SHHGIT_CONFIG_FILE}"

audit_shhgit: audi_shhgit_prepare
	docker run \
		   --rm \
		   -v "${PWD}:/src/" \
		   -v /tmp/config.yaml:/app/config.yaml \
		   eth0izzle/shhgit \
		   -debug \
		   -local "/src" \
		   -config-path /app/ \
		   -entropy-threshold 0 \
		   -csv-path "/src/${SHHGIT_RESULTS}"
