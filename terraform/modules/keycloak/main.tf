resource "kubernetes_namespace" "keycloak" {
  metadata {
    name = "${{var.name_space}"
  }
}

resource "kubernetes_replication_controller" "database" {
  metadata {
    name      = "db"
    namespace = "${var.name_space}"

    labels {
      app = "${var.db_name}"
    }
  }

  spec {
    replicas = "${var.db_replicas}"

    selector {
      app = "${var.db_name}"
    }

    template {
      container {
        image = "${var.db_image}"

        name = "${var.db_name}"
        args = ["--wsrep-new-cluster"]

        port {
          container_port = 3306
          name           = "mysql"
        }

        port {
          container_port = 4444
          name           = "sst"
        }

        port {
          container_port = 4567
          protocol       = "TCP"
          name           = "replication-tcp"
        }

        port {
          container_port = 4567
          protocol       = "UDP"
          name           = "replication-udp"
        }

        port {
          container_port = 4568
          name           = "ist"
        }

        env {
          name  = "MYSQL_RANDOM_ROOT_PASSWORD"
          value = "yes"
        }

        env {
          name  = "MYSQL_DATABASE"
          value = "${var.db_instance_name}"
        }

        env {
          name  = "MYSQL_USER"
          value = "${var.db.user}"
        }

        env {
          name  = "MYSQL_PASSWORD"
          value = "${var.db_password}"
        }

        env {
          name  = "MYSQL_INITDB_SKIP_TZINFO"
          value = "yes"
        }
      }
    }
  }
}

resource "kubernetes_service" "database" {
  metadata {
    name      = "${var.db_service_name}"
    namespace = "${var.name_space}"

    labels {
      app = "${var.db_name}"
    }
  }

  spec {
    selector {
      app = "${kubernetes_replication_controller.database.metadata.0.labels.app}"
    }

    port {
      port        = 3306
      target_port = 3306
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_replication_controller" "keycloak" {
  metadata {
    name      = "app"
    namespace = "${var.name_space}"

    labels {
      app = "${var.app_name}"
    }
  }

  spec {
    replicas = 3

    selector {
      app = "${var.app_name}"
    }

    template {
      container {
        image = "${var.app_image}"
        name  = "keycloak-ha"

        args = [
          "-b=0.0.0.0",
          "-bmanagement=0.0.0.0",
          "--server-config=standalone-ha.xml",
        ]

        port {
          container_port = 8080
          name           = "http"
        }

        port {
          container_port = 8443
          name           = "https"
        }

        port {
          container_port = 9090
          name           = "mgmt"
        }

        port {
          container_port = 7600
          name           = "jgroups-tcp"
        }

        port {
          container_port = 57600
          name           = "jgroups-tcp-fd"
        }

        port {
          container_port = 55200
          name           = "jgroups-udp"
          protocol       = "UDP"
        }

        port {
          container_port = 45688
          name           = "jgroups-udp-mc"
          protocol       = "UDP"
        }

        port {
          container_port = 54200
          name           = "jgroups-udp-fd"
          protocol       = "UDP"
        }

        port {
          container_port = 23364
          name           = "modcluster"
        }

        port {
          container_port = 23364
          name           = "modcluster-udp"
          protocol       = "UDP"
        }

        port {
          container_port = 4712
          name           = "txn-ev"
        }

        port {
          container_port = 4713
          name           = "txn-mgr"
        }

        env {
          name  = "MYSQL_DATABASE"
          value = "${var.db_instance_name}"
        }

        env {
          name  = "MYSQL_USERNAME"
          value = "${var.db.user}"
        }

        env {
          name  = "MYSQL_PASSWORD"
          value = "${var.db_password}"
        }

        env {
          name  = "MYSQL_INITDB_SKIP_TZINFO"
          value = "yes"
        }

        env {
          name  = "MYSQL_PORT_3306_TCP_ADDR"
          value = "${var.db_service_name}.${var.name_space}"
        }

        env {
          name  = "MYSQL_PORT_3306_TCP_PORT"
          value = "3306"
        }

        env {
          name  = "KEYCLOAK_USER"
          value = "${var.keycloak_admin_user}"
        }

        env {
          name  = "KEYCLOAK_PASSWORD"
          value = "${var.keycloak_admin_pass}"
        }
      }
    }
  }
}

resource "kubernetes_service" "keycloak" {
  metadata {
    name      = "keycloak-internal"
    namespace = "${var.name_space}"

    labels {
      app     = "${var.app_name}"
      service = "internal"
    }
  }

  spec {
    selector {
      app = "${kubernetes_replication_controller.keycloak.metadata.0.labels.app}"
    }

    type             = "ClusterIP"
  }
}



