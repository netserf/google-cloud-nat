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

data "google_client_config" "this" {}

data "google_compute_network" "net" {
  project = data.google_client_config.this.project
  name    = var.network_name
}

data "google_compute_subnetwork" "subnet" {
  name = var.subnet_name
}

resource "google_compute_router" "router" {
  name    = var.router_name
  region  = data.google_compute_subnetwork.subnet.region
  network = data.google_compute_network.net.id
}

resource "google_compute_router_nat" "nat" {
  name                               = var.nat_name
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

output "project" {
  value = data.google_client_config.this.project
}

output "network_id" {
  value = data.google_compute_network.net.id
}

output "subnet_name" {
  value = data.google_compute_subnetwork.subnet.name
}

output "router_name" {
  value = google_compute_router.router.name
}

output "nat_name" {
  value = google_compute_router_nat.nat.name
}
