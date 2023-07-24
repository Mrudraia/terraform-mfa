SHELL := /bin/bash
LANG := en-US.UTF-8

ifndef RESOURCE_PREFIX
$(error RESOURCE_PREFIX is not set, please read the README and set using .envrc.)
endif

ifndef IC_API_KEY
$(error IC_API_KEY is not set, please read the README and set using .envrc.)
endif


.PHONY: all

terraform_init:
	cd terraform && terraform init -upgrade
	
login_ibmcloud: 
	@ibmcloud login --apikey $(IC_API_KEY) -r $(LOCATION_REGION) -a $(CLOUD_ENDPOINT)


get_cluster_config: login_ibmcloud 
	export KUBECONFIG="$(pwd)/.kube/config"
	ibmcloud ks cluster config --cluster $(CLUSTER_ID) --admin
	


install-agent:
	cd mfa-core && terraform init && terraform apply --auto-approve
	cd mfa-secret && terraform init && terraform apply --auto-approve

uninstall-agent:
	cd mfa-secret && terraform destroy --auto-approve

install-offering:
	cd mfa-offering && terraform init &&  terraform apply --auto-approve
	cd mfa-offering-df && terraform init && terraform apply --auto-approve
	
uninstall-offering:
	cd mfa-offering-df &&  terraform destroy --auto-approve

.PHONY: install_agent uninstall-agent install-offering uninstall-offering