vp: requirements.txt
	virtualenv --no-site-packages vp
	vp/bin/pip install -U pip setuptools
	vp/bin/pip install -r requirements.txt

provision-production:
	ansible-playbook -i production playbooks/provision.yml --private-key keys/wasantha-athukorala-web-aws.pem

deploy-production:
	ansible-playbook -i production playbooks/deploy.yml --private-key keys/wasantha-athukorala-web-aws.pem --extra-vars "website_version=$(ARGS)"

complete: provision-production deploy-production
