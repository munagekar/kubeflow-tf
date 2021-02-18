resource "kubernetes_manifest" "iap_backend_config" {
  provider = kubernetes-alpha

  manifest = {
    "apiVersion" = "cloud.google.com/v1"
    "kind"       = "BackendConfig"
    "metadata" = {
      "name"      = "iap-backendconfig"
      "namespace" = "istio-system"
    }
    "spec" = {
      "iap" = {
        "enabled" = true
        "oauthclientCredentials" = {
          "secretName" = "kubeflow-oauth"
        }
      }
      "timeoutSec" = 3600
    }
  }
}

resource "kubernetes_manifest" "managed_certificate" {
  provider = kubernetes-alpha
  manifest = {
    "apiVersion" = "networking.gke.io/v1"
    "kind"       = "ManagedCertificate"
    "metadata" = {
      "name"      = "gke-certificate"
      "namespace" = "istio-system"
    }
    "spec" = {
      "domains" = [
        var.cloud_endpoint,
      ]
    }
  }
}