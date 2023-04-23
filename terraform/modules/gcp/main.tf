resource "google_compute_instance" "gitlab-runner" {
  name         = "gitlab-runner"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  metadata_startup_script = "sudo useradd -m -s /bin/bash vagrant"
  
  metadata = {
    ssh-keys = "vagrant:${file("~/.ssh/id_rsa.pub")}"
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.external_ip.address
    }
  }
}

resource "google_compute_address" "external_ip" {
  name = "example-external-ip"
  region = var.region
}

