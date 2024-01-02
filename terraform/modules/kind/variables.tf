variable "azure_client_id" {
  description = "Azure client Id to connect to keyvault"
  type = string
  default = null
}

variable "azure_client_secret" {
  description = "Azure client secret to connect to keyvault"
  type = string
  default = null
  
}

variable "azure_tenant_id" {
  description = "Azure tenant Id to connect to keyvault"
  type = string
  default = null
}

variable "cluster_name" {
  description = "Kind cluster name"
  type        = string
  default     = "default"

}

variable "cluster_node_image" {
  description = "Kind cluster node image"
  type        = string
  default     = "kindest/node:v1.27.1"

}

variable "enable_azure_keyvault_decrypt" {
  description = "Enable Azure key vault to decrypt secrets"
  type = bool
  default = false
  
}

variable "flux_cluster_domain" {
  type        = string
  default     = "cluster.local"
  description = "(String) The internal cluster domain."
}

variable "flux_components" {
  type        = list(string)
  default     = ["source-controller", "kustomize-controller", "helm-controller", "notification-controller"]
  description = "(Set of String) Toolkit components to include in the install manifests. Defaults to"

}

variable "flux_components_extra" {
  type        = list(string)
  default     = null
  description = "(Set of String) List of extra components to include in the install manifests."
}

variable "flux_disable_secret_creation" {
  type        = bool
  default     = null
  description = "(Boolean) Use the existing secret for flux controller and don't create one from bootstrap"

}

variable "flux_image_pull_secret" {
  type        = string
  default     = null
  description = "(String) Kubernetes secret name used for pulling the toolkit images from a private registry."
}

variable "flux_interval" {
  type        = string
  default     = "1m0s"
  description = "(String) Interval at which to reconcile from bootstrap repository. "

}

variable "flux_kustomization_override" {
  type        = string
  default     = null
  description = "(String) Kustomization to override configuration set by default."

}

variable "flux_log_level" {
  type        = string
  default     = "info"
  description = "String) Log level for toolkit components."
}


variable "flux_namespace" {
  type        = string
  default     = "flux-system"
  description = " (Required) Specifies the namespace to which this configuration is installed to. Changing this forces a new Kubernetes Flux Configuration to be created."
}


variable "flux_network_policy" {
  type        = bool
  default     = true
  description = "(Boolean) Deny ingress access to the toolkit controllers from other namespaces using network policies."
}

variable "flux_recurse_submodules" {
  type        = bool
  default     = null
  description = "Boolean) Configures the GitRepository source to initialize and include Git submodules in the artifact it produces"


}

variable "flux_registry" {
  type        = string
  default     = "ghcr.io/fluxcd"
  description = "(String) Container registry where the toolkit images are published."

}

variable "flux_secret_name" {
  type        = string
  default     = "flux-system"
  description = "(String) Name of the secret the sync credentials can be found in or stored to."
}

# variable "flux_sops_age_private_key" {
#   description = "Private key to decrypt kubernetes secrets encrypted using age"
#   type        = string
# }
variable "flux_toleration_keys" {
  type        = list(string)
  default     = null
  description = "(Set of String) List of toleration keys used to schedule the components pods onto nodes with matching taints."

}

variable "flux_version" {
  type        = string
  default     = "v2.0.1"
  description = "(String) Flux version."

}

variable "flux_watch_all_namespaces" {
  type        = bool
  default     = true
  description = "(Boolean) If true watch for custom resources in all namespaces."

}




variable "github_group" {
  description = "github group to bootstrap flux CD"
  type        = string
  default     = "vimuchiaroni.devops/gitops"

}



variable "github_project" {
  description = "github project to bootstrap flux CD"
  type        = string
  default     = "flux-fleet"

}

variable "github_token" {
  description = "Token to access github"
  type        = string
}



variable "kind_api_version" {
  description = "Kind cluster api version"
  type        = string
  default     = "kind.x-k8s.io/v1alpha4"

}

variable "kind_nodes" {
  description = "Kind node count and roles"
  type        = any
  default = [
    {
      role = "control-plane"
    }
  ]

}

variable "kustomization_override" {
  description = "Yaml file to override flux default configuration"
  type        = string
  default     = null

}