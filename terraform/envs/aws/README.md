# How to use it?

1. Set env vars AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_SESSION_TOKEN example.
2. Init terraform: `terraform init -upgrade=true`
3. Review changes: `terraform plan`
4. Apply changes:`terraform apply`
5. Print IPs: `terraform output public_ips`
6. Check connection: `ssh -i path/to/key ec2-user@$(terraform output -raw public_ips)`
7. Ansible integration example:

```shell
ansible-playbook \
    -i "$(terraform output -raw public_ips) ," \
    some/path/playbook.yml
```
