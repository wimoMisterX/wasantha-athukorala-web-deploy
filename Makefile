vp: requirements.txt
	virtualenv --no-site-packages vp
	vp/bin/pip install -U pip setuptools
	vp/bin/pip install -r requirements.txt

provision-production-aws:
	ansible-playbook -i production provision.yml --private-key keys/wasantha-athukorala-web-aws.pem -u ubuntu

deploy-production-aws:
	ansible-playbook -i production deploy.yml --private-key keys/wasantha-athukorala-web-aws.pem --extra-vars "website_version=$(ARGS)" -u ubuntu

complete-aws: provision-production-aws deploy-production-aws

complete-vagrant:
	vagrant up
	ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory deploy.yml --extra-vars="website_version=$(ARGS)"
