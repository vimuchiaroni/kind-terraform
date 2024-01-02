resource "kind_cluster" "main" {
  name       = var.cluster_name
  node_image = var.cluster_node_image
  kind_config {
    kind        = "Cluster"
    api_version = var.kind_api_version
    dynamic "node" {
      for_each = var.kind_nodes
      content {
        role = lookup(node.value, "role")
      }

    }
  }
}


resource "kubernetes_namespace" "main" {
  depends_on = [kind_cluster.main]
  metadata {

    name = var.flux_namespace
  }
}