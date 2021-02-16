variable "kf_name" {
  description = "Name of Kubeflow Cluster"
  type        = string
}

variable "gcp_region" {
  description = "Region for Kubeflow Cluster"
  type        = string
}

variable "cloud_endpoint" {
  description = "Cloud Endpoint. Eg: api-name.endpoints.project-id.cloud.goog"
}
