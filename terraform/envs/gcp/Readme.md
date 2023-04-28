# Install Google cloud CLI
https://cloud.google.com/sdk/docs/install#rpm

sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-cli]
name=Google Cloud CLI
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM

sudo yum install google-cloud-cli

gcloud init
gcloud auth application-default login

# create ssh key pairs
create ssh keys
ssh-keygen -b 2048 -t rsa

# Init terraform, plan config, apply config
terraform init 
terraform plan -var-file=secrets.tfvars
terraform aply -var-file=secrets.tfvars

# connect to vm 
ssh -i ~/.ssh/id_rsa vagrant@$(terraform output -raw public_ip)

# To delete your infrastructure 
terraform destroy