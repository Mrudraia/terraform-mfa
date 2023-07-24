#Install the Managed Fusion Ofeering
terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "kubernetes" {
    config_path    = "../.kube/config"
}

resource "kubectl_manifest" "managed-fusion-offering" {
    yaml_body = file("${path.module}/manifests/mfa-offering.yaml")
}