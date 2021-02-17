resource "kubernetes_secret" "oauth2_credentials" {
  metadata {
    name      = "kubeflow-oauth"
    namespace = "istio-system" # This Namespace Should Already Exist
  }

  data = {
    client_id     = var.oauth2_client_id
    client_secret = var.oauth2_client_secret
  }
}