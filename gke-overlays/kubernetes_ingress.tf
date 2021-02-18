resource "kubernetes_ingress" "envoy_ingress" {
  metadata {
    name      = "envoy-ingress"
    namespace = "istio-system"
    annotations = {
      "ingress.kubernetes.io/ssl-redirect" : "true"
      "kubernetes.io/ingress.class" : "gce"
      "kubernetes.io/ingress.global-static-ip-name" : google_compute_address.ip_address.name
      "networking.gke.io/managed-certificates" : "gke-certificate"
    }
  }
  spec {
    rule {
      host = var.cloud_endpoint
      http {
        path {
          path = "/*"
          backend {
            service_name = "istio-ingressgateway"
            service_port = "80"
          }
        }
      }
    }

  }
}