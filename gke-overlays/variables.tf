variable "kf_name" {
  description = "Name of Kubeflow Cluster"
  type        = string
}

variable "cloud_endpoint" {
  description = "Cloud Endpoint. Eg: api-name.endpoints.project-id.cloud.goog"
}


variable "oauth2_client_id" {
  description = "Oauth2 Client ID"
}

variable "oauth2_client_secret" {
  description = "Oauth2 Client Secret"
}
