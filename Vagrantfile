Vagrant.configure('2') do |config|
  config.ssh.insert_key = false

  config.vm.synced_folder '.',
                          '/vagrant',
                          mount_options: ['dmode=775,fmode=755']
  config.vm.box = 'bento/centos-7.9'
  # it's required for forwarding ssh-agent
  # https://www.goncharov.xyz/it/keepass.html
  config.ssh.forward_agent = true
  
  config.vm.network "forwarded_port", guest: 8081, host: 8081

  # config.vm.provision "shell", path: "vagrant/provision_devtoolkit.sh"

  config.vm.provision 'ansible_local' do |ansible|
    # https://www.vagrantup.com/docs/provisioning/ansible_local
    # https://www.vagrantup.com/docs/provisioning/ansible_common
    ansible.install = true
    ansible.galaxy_roles_path = "/home/vagrant/.ansible/roles"
    ansible.galaxy_role_file = "vagrant/requirements.yml"
    ansible.playbook = "vagrant/provision_me.yml"
    ansible.verbose = 'v'
  end

  config.vm.provider 'virtualbox' do |v|
    v.memory = 2048
  end
end
