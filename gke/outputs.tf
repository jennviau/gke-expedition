output "cluster_name" {
  value = "${google_container_cluster.cluster.name}"
}

output "cluster_zone" {
  value = "${google_container_cluster.cluster.zone}"
}
