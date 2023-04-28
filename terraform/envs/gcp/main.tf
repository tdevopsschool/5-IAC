module "gcp" {
  source = "../../modules/gcp"
  project = var.project
  region  = var.region
  zone    = var.zone
}
