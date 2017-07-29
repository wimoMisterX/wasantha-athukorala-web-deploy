# wasantha-athukorala-web-deploy

This repo is an ansible deployment dedicated for https://github.com/wimoMisterX/wasantha-athukorala-web.

## Setup instructions
1. Build python virtual env `make vp`
2. Activate virtaul env `source vp/bin/activate`

## Before Provision/Deploy
* Unlock encrypted files in repo using `git-crypt unlock` (Note your gpg key needs to be added as a collaborator)

## Provision
* Run the `provision.yml` playbook with the arguments:
  * remote_user
  * private_key

## Deploy
* Run the `deploy.yml` playbook wih the arguments:
  * remote_user
  * private_key
  * website_version

## Testing locally
* Install `vagrant`
* Bring up the VM by `vagrant up`
* Run the `deploy.yml` playbook
* Visit `localhost:8080`
