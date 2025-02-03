locals {
  oidc_identity = split("/", var.oidc_url)[4]
}