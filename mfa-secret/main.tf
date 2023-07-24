## Managed fusion Installation secret using Terraform
provider "kubernetes" {
    config_path    = "../.kube/config"
}


resource "kubernetes_secret" "managed-fusion-agent-config" {
    metadata {
        name = "managed-fusion-agent-config"
        namespace = "managed-fusion"
    }
    type = "Opaque"
    
    data = {
        "pager_duty_config" = base64decode("ICAgc29wRW5kcG9pbnQ6IDxwYWdlciBkdXR5IHNlcnZpY2UgZW5kcG9pbnQ+CiAgIHNlcnZpY2VLZXk6IDxwYWdlciBkdXR5IHNlcnZpY2Ugc2VjcmV0IGtleT4=")
        "smtp_config" = base64decode("ICAgIGVuZHBvaW50OiBodHRwczovL3NvbWV0aGluZy50ZXN0OjgwODAKICAgIHVzZXJuYW1lOiA8c21wdCBzZXJ2aWNlIGFjY291bnQgdXNlcm5hbWU+CiAgICBwYXNzd29yZDogPHNtcHQgc2VydmljZSBhY2NvdW50IHBhc3N3b3JkPgogICAgZnJvbUFkZHJlc3M6IDxmb3JtIGFkZHJlc3MgZm9yIG91dGdvaW5nIGVtYWlscz4KICAgIG5vdGlmaWNhdGlvbkVtYWlsczoKICAgIC0gPGN1c3RvbWVyIGVtYWlsIGFkZHJlc3MgZm9yIHByb3ZpZGVyIG5vdGlmaWNhdGlvbnM+CiAgICAtIDxBbm90aGVyIGN1c3RvbWVyIGVtYWlsIGFkZHJlc3MgZm9yIHByb3ZpZGVyIG5vdGlmaWNhdGlvbnM+Cg==")
    }
}