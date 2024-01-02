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




  github_group = "vimuchiaroni"
  github_project = "flux-terraform-azure"
  github_token   = var.github_token


}