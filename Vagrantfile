Vagrant.configure('2') do |config|
  config.ssh.insert_key = false

  config.vm.synced_folder '.',
                          '/vagrant',
                          type: "rsync",
                          rsync__exclude: ".git/"

  config.vm.box = 'generic/rocky8'

  # it's required for forwarding ssh-agent
  # https://www.goncharov.xyz/it/keepass.html
  config.ssh.forward_agent = true

  config.vm.network "forwarded_port", guest: 8081, host: 8081

  # config.vm.provision "shell", path: "vagrant/provision_devtoolkit.sh"

  # we don't install ansible automatically because there is the issue for centos/rocky 8
  # after fixing https://github.com/hashicorp/vagrant/issues/11299 we should remove it
  #  Vagrant assumes that this means the command failed!
  #
  #  dnf -y install curl gcc libffi-devel openssl-devel python-crypto python-devel python-setuptools
  #
  #  Stdout from the command:
  #
  #  Last metadata expiration check: 0:03:56 ago on Thu 04 May 2023 10:15:36 AM UTC.
  #  Package curl-7.61.1-25.el8_7.3.x86_64 is already installed.
  #  Package gcc-8.5.0-16.el8_7.x86_64 is already installed.
  #  No match for argument: python-crypto
  #  No match for argument: python-devel
  #  No match for argument: python-setuptools
  #
  #
  #  Stderr from the command:
  #
  #  Error: Unable to find a match: python-crypto python-devel python-setuptools
  config.vm.provision "shell", path: "vagrant/install_ansible.sh"

  config.vm.provision 'ansible_local' do |ansible|
    # https://www.vagrantup.com/docs/provisioning/ansible_local
    # https://www.vagrantup.com/docs/provisioning/ansible_common
    ansible.install = false
    ansible.galaxy_roles_path = "/home/vagrant/.ansible/roles"
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
