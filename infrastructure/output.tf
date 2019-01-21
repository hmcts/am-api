output "microserviceName" {
  value = "${var.component}"
}

output "vaultName" {
  value = "${module.am-vault-api.key_vault_name}"
}