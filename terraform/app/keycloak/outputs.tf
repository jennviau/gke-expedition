output "external-ip" {
  value = "${kubernetes_service.keycloak.load_balancer_ingress.0.ip}"
}
