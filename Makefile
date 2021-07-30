
SHELL = /bin/bash

# variables
TRUFFLEHOG_ENTROPY ?= False


# 1. SECRET DETECTION
secret_detection: audit_trufflehog

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
