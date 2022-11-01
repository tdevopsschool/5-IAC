# Prepare host

We use [dynamic inventory plugin](https://docs.ansible.com/ansible/latest/plugins/inventory.html). It our case it [aws_ec2_inventory](https://docs.ansible.com/ansible/latest/collections/amazon/aws/aws_ec2_inventory.html) plugin.

1. Install aws collection `ansible-galaxy collection install -p ~/.ansible/collections/ansible_collections amazon.aws`
2. Install the dependencies required by the collection `pip3 install --user boto3`
3. Set environment variables:

```bash
export AWS_ACCESS_KEY_ID="***"
export AWS_SECRET_ACCESS_KEY="***"
```

## check the dynamic inventory

```bash
ansible-inventory -i sandbox_aws_ec2.yml --graph
ansible -u ec2-user -i sandbox_aws_ec2.yml -m ping all

```

## Install docker 

```bash
ansible-playbook \
    -vvv \
    -u ec2-user \
    -i /vagrant/ansible/sandbox_aws_ec2.yml \
    /vagrant/ansible/install_docker.yml
```

## Install gitlab runner

```bash
ansible-playbook \
    -vvv \
    -e "gitlab_runner_registration_token=your_token" \
    -u ec2-user \
    -i /vagrant/ansible/sandbox_aws_ec2.yml \
    /vagrant/ansible/install_gitlab_runner.yml
```
