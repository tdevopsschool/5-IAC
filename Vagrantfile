Vagrant.configure('2') do |config|
  config.ssh.insert_key = false

  config.vm.synced_folder '.',
                          '/vagrant',
                          type: "rsync",
                          rsync__exclude: ".git/"

  if Vagrant::Util::Platform.darwin?
    config.vm.box = 'generic/rocky8'
  else
    config.vm.box = 'bento/centos-7.9'
  end

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
    ansible.install_mode = "pip_args_only"
    ansible.pip_args = "-r /vagrant/vagrant/requirements.txt"
    ansible.galaxy_role_file = "vagrant/requirements.yml"
    ansible.playbook = "vagrant/provision_me.yml"
    ansible.verbose = 'v'
  end

  config.vm.provider 'qemu' do |qe|
    qe.arch = 'x86_64'
    qe.machine = 'q35'
    qe.cpu = 'max'
    qe.net_device = 'virtio-net-pci'
    qe.memory = '4G'
  end
  config.vm.provider 'virtualbox' do |v|
    v.memory = 2048
  end
end
