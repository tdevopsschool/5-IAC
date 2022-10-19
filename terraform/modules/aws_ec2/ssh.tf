resource "aws_key_pair" "ssh_key" {
  key_name   = "deploy-1"
  public_key = var.ssh_key
}
