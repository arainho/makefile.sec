
SHELL = /bin/bash


# VARIABLES
RESULTS_FOLDER ?= "results/"

## container scanning
REGISTRY ?= docker.io
IMAGE_NAME ?= alpine
IMAGE_TAG ?= latest

## sast
# SONAR_URL ?= https://sonarcloud.io	# URL for Sonar(Cloud|Qube)

## secret detection
TRUFFLEHOG_ENTROPY ?= False
TRUFFLEHOG_REPORT ?= trufflehog_report.json
SHHGIT_CONFIG_FILE ?= "config.yaml"


# CONTAINER SCANNING
container_scanning: audit_grype audit_trivy

audit_grype:
	$(GRYPE) $(REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)

audit_trivy_prepare:
	docker run \
		   --rm \
		   -v /var/run/docker.sock:/var/run/docker.sock \
		   -v $(HOME)/.cache:/root/.cache/ aquasec/trivy --clear-cache

audit_trivy: audit_trivy_prepare
	docker run \
		   --rm \
		   -v /var/run/docker.sock:/var/run/docker.sock \
		   -v $(HOME)/.cache:/root/.cache/ aquasec/trivy \
		   $(REGISTRY)/$(IMAGE_NAME):$(IMAGE_TAG)

# SAST
sast: audit_slscan

audit_slscan:
	cp "./tests/sast_rules.json"  "$(RESULTS_FOLDER)/.sastscanrc"
	docker run --rm -e "WORKSPACE=$(RESULTS_FOLDER)" \
		   -v $(RESULTS_FOLDER):/app shiftleft/sast-scan scan \
		   --type credscan,depscan,ansible,aws,bash,go,groovy,python,kubernetes,serverless,terraform,vf,vm,yaml \
		   --out_dir /app/reports --mode deploy
	rm -- "$(RESULTS_FOLDER)/.sastscanrc"

audit_sonar:
	docker run \
		   --rm \
		   -e SONAR_LOGIN="$(SONAR_LOGIN)" \
		   -e SONAR_HOST_URL="http://$(SONAR_URL)" \
		   -v "${PWD}:/usr/src" \
		   -v ${HOME}/.sonar/cache:/opt/sonar-scanner/.sonar/cache \
		   sonarsource/sonar-scanner-cli -Dsonar.verbose=true

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
       file:///target | tee $(RESULTS_FOLDER)/trufflehog_report.json | jq -C
 
 audi_shhgit_prepare:
	rm -f -- "$(PWD)/$(RESULTS_FOLDER)"
	rm -f -- "$(SHHGIT_CONFIG_FILE)"
	curl https://raw.githubusercontent.com/eth0izzle/shhgit/master/config.yaml -o "$(SHHGIT_CONFIG_FILE)"

audit_shhgit: audi_shhgit_prepare
	docker run \
		   --rm \
		   -v "$(PWD):/src/" \
		   -v /tmp/config.yaml:/app/config.yaml \
		   eth0izzle/shhgit \
		   -debug \
		   -local "/src" \
		   -config-path /app/ \
		   -entropy-threshold 0 \
		   -csv-path "/src/$(RESULTS_FOLDER)"
