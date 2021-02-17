resource "google_endpoints_service" "openapi_service" {
  service_name = "kubeflow"
  openapi_config = format(
    file("${path.module}/openapi_spec.yml"),
    var.cloud_endpoint,
    var.cloud_endpoint,
    google_compute_address.ip_address.address
  )
}