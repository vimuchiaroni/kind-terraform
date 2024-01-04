module "kind_cluster" {
  source       = "./modules/kind"
  cluster_name = "tfkind"
  kind_nodes = [
    {
      role = "control-plane"
    },
    {
      role = "worker"
    }
  ]




  github_username = var.github_username
  github_project = var.github_project
  github_token   = var.github_token


}