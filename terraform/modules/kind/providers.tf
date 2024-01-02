terraform {
  required_providers {
    flux = {
      source  = "fluxcd/flux"
      version = ">= 1.2.2"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12.1"

    }
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.2.0"

    }
  }
}

provider "flux" {
  kubernetes = {
    host = kind_cluster.main.endpoint

    client_certificate     = kind_cluster.main.client_certificate
    client_key             = kind_cluster.main.client_key
    cluster_ca_certificate = kind_cluster.main.cluster_ca_certificate
  }
  git = {
    url = "https://github.com/${var.github_group}/${var.github_project}.git"
    http = {
      username = var.github_token
      password = var.github_token
    }
  }
}


provider "helm" {
    kubernetes {
        host = kind_cluster.main.endpoint
        client_certificate     = kind_cluster.main.client_certificate
        client_key             = kind_cluster.main.client_key
        cluster_ca_certificate = kind_cluster.main.cluster_ca_certificate
    }

}

provider "kubernetes" {
  host = kind_cluster.main.endpoint

  client_certificate     = kind_cluster.main.client_certificate
  client_key             = kind_cluster.main.client_key
  cluster_ca_certificate = kind_cluster.main.cluster_ca_certificate
}