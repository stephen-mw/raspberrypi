default: deploy

deploy:
	ansible-playbook -i "scanny.local," provision.yml -e @../../configuration/playbook/secrets.yml --ask-vault-pass
