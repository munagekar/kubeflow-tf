resource "google_compute_address" "ip_address" {
  name = var.kf_name
  region = var.gcp_region
}