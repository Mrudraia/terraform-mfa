#Install the Managed Fusion Ofeering
terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.22.0"
    }
  }
}

provider "kubernetes" {
    config_path    = "../.kube/config"
}


resource "kubernetes_namespace" "managed-fusion" {
    metadata {
      name = "fusion-storage"
      labels = {
        "misf.ibm.com/managed" = "true"
      }
    }
}

