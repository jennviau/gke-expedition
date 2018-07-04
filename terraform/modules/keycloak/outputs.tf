data "kubernetes_service" "ingress" {
}

output "ip_address" {
value = "${kubernetes_service.ingress.public_ip}"

 }