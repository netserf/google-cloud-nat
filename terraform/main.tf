terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  // TODO: Add your GCP credentials, if outside Cloud Shell
}

data "google_compute_network" "net" {
  name = var.network_name
}

data "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  network       = google_compute_network.net.id
}

output "subnet_region" {
  value = data.google_compute_subnetwork.subnet.region
}

output "network_id" {
  value = data.google_compute_network.net.id
}

output "router_name" {
  value = data.google_compute_router.router.name
}

output "router_region" {
  value = data.google_compute_router.router.region
}

#resource "google_compute_router" "router" {
#  name    = var.router_name
#  region  = google_compute_subnetwork.subnet.region
#  network = google_compute_network.net.id
#}

#resource "google_compute_router_nat" "nat" {
#  name                               = var.nat_name
#  router                             = google_compute_router.router.name
#  region                             = google_compute_router.router.region
#  nat_ip_allocate_option             = "AUTO_ONLY"
#  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
#
#  log_config {
#    enable = true
#    filter = "ERRORS_ONLY"
#  }
#}
