clean:
	rm -rf .terraform .terraform.lock.hcl terraform.tfstate.backup

plan: clean
	terraform init
	terraform plan
	$(MAKE) clean

apply: clean
	terraform init
	terraform apply -auto-approve
	$(MAKE) clean

destroy: clean
	terraform init
	terraform destroy -auto-approve
	$(MAKE) clean