

# Install gitlab runner

## AWS

### Prepare host AWS

We use [dynamic inventory plugin](https://docs.ansible.com/ansible/latest/plugins/inventory.html). It our case it [aws_ec2_inventory](https://docs.ansible.com/ansible/latest/collections/amazon/aws/aws_ec2_inventory.html) plugin.

1. Install collection

```bash
ansible-galaxy collection install -r ansible/requirements.yml
```

2. Install the dependencies required by the collection

```bash
pip install --upgrade pip
pip install --upgrade setuptools==62.0.0
pip install -r ansible/requirements.txt
```

3. Set environment variables:

```bash
export AWS_ACCESS_KEY_ID="***"
export AWS_SECRET_ACCESS_KEY="***"
```

### Check the dynamic inventory

```bash
ansible-inventory -i sandbox_aws_ec2.yml --graph
ansible -u ec2-user -i sandbox_aws_ec2.yml -m ping all

```

## Install gitlab runner AWS

```bash
ansible-playbook \
    -vvv \
    -e "gitlab_runner_registration_token=your_token runner_tags=devops_school1,devops_school2" \
    -u ec2-user \
    -i /vagrant/ansible/sandbox_aws_ec2.yml \
    /vagrant/ansible/install_gitlab_runner.yml
```

## GCP

```bash
pip install --upgrade pip
pip install --upgrade setuptools==62.0.0
pip install -r ansible/requirements.txt
sudo yum install python-requests
```

### Credential preparation

Create and upload gce creds in json to place where you are using ansible
https://docs.ansible.com/ansible/latest/scenario_guides/guide_gce.html

change the path to the cred file and your project name in google_cloud_filter.gcp.yml

### Check Dynamic ansible inventory GCP

```bash
ansible-inventory --list -i google_cloud_filter.gcp.yml
ansible -u vagrant -i google_cloud_filter.gcp.yml -m ping all
```

### Install gitlab runner GCP

```bash
ansible-playbook \
    -vvv \
    -e "gitlab_runner_registration_token=xxx runner_tags=devops_school1,devops_school2" \
    -u vagrant \
    -i google_cloud_filter.gcp.yml \
    /vagrant/ansible/install_gitlab_runner.yml
```
