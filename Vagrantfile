Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  # Disable the new default behavior introduced in Vagrant 1.7, to
  # ensure that all Vagrant machines will use the same SSH key pair.
  # See https://github.com/mitchellh/vagrant/issues/5005
  config.ssh.insert_key = false

  config.vm.define "web-01"

  config.vm.provider :virtualbox do |vb|
    vb.name = "wasantha-athukorala-web-01"
  end

  config.vm.network "forwarded_port", guest: 80, host: 8080, id: "nginx_port"

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "provision.yml"
    ansible.groups = {
      "webservers" => ['web-01']
    }
  end
end
