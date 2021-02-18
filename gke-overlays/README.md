# GKE Overlays

GKE additional resources for Authentication.

- This module simplifies installation of kubeflow on gke without GKE blueprints 
and creation of an additional management cluster.
- This allows you to use standard kubernetes tooling to create a declarative kubernetes cluster.

## Steps

- Create an Oauth2 ClientID.
- Save the client_id and client_secret to GCP Secret Manager.
- Use a DataSource to reference them in terraform.

```terraform
data "google_secret_manager_secret_version" "oauth2_client_id" {
  secret = "oauth2-client-id"
}

data "google_secret_manager_secret_version" "oauth2_client_secret" {
  secret = "oauth2-client-secret"
}
```

- Use this Module
```terraform
module "gke_overlays" {
  source               = "git::https://github.com/munagekar/kubeflow-tf//gke-overlays?ref=master"
  kf_name              = "kf"   # Name of Kubeflow Deployment, Used to Create Global Ip Address
  gcp_region           = "asia-east1" # Name of a GCP Region, Preferably with GPU and TPU
  cloud_endpoint       = "kf.endpoints.project-id.cloud.goog" # Your Project ID
  oauth2_client_id     = data.google_secret_manager_secret_version.oauth2_client_id.secret_data
  oauth2_client_secret = data.google_secret_manager_secret_version.oauth2_client_secret.secret_data

  providers = {
    kubernetes       = kubernetes
    kubernetes-alpha = kubernetes-alpha
  }
}
```