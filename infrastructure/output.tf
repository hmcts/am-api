output "microserviceName" {
  value = "${var.component}"
}

output "vaultName" {
  value = "${module.am-vault-api.key_vault_name}"
}

output "sharedResourceGroup" {
  value = "${local.sharedResourceGroup}"
}

output "shared_vault_uri" {
  value = "${data.azurerm_key_vault.am-shared-vault.vault_uri}"
}
