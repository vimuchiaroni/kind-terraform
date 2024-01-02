resource "flux_bootstrap_git" "main" {
  depends_on = [ kind_cluster.main, kubernetes_namespace.main ]
  path                    = "clusters/${var.cluster_name}"
  cluster_domain          = var.flux_cluster_domain
  components              = var.flux_components
  components_extra        = var.flux_components_extra
  disable_secret_creation = var.flux_disable_secret_creation
  image_pull_secret       = var.flux_image_pull_secret
  interval                = var.flux_interval
  log_level               = var.flux_log_level
  namespace               = var.flux_namespace
  network_policy          = var.flux_network_policy
  recurse_submodules      = var.flux_recurse_submodules
  registry                = var.flux_registry
  secret_name             = var.flux_secret_name
  toleration_keys         = var.flux_toleration_keys
  version                 = var.flux_version
  watch_all_namespaces    = var.flux_watch_all_namespaces
  kustomization_override  = var.kustomization_override
}

resource "helm_release" "main" {
  depends_on = [ kind_cluster.main, kubernetes_namespace.main,flux_bootstrap_git.main]
  name       = "tf-controller"
  repository = "https://weaveworks.github.io/tf-controller/"
  chart      = "tf-controller"
  version    = "v0.16.0-rc.3"
  namespace = var.flux_namespace
}