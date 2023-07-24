terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.22.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}


provider "kubernetes" {
    config_path    = "../.kube/config"
}


resource "kubernetes_namespace" "managed-fusion" {
    metadata {
      name = "managed-fusion"
      labels = {
        "misf.ibm.com/managed" = "true"
      }
    }
}

resource "kubectl_manifest" "operator-group" {
    yaml_body = file("${path.module}/manifests/operator-group.yaml")
}

resource "kubectl_manifest" "catalog-source" {
    yaml_body = file("${path.module}/manifests/catalog-source.yaml")
}

resource "kubectl_manifest" "subscription" {
    yaml_body = file("${path.module}/manifests/subscription.yaml")
}
