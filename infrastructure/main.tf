provider "azurerm" {}

locals {
  ase_name               = "${data.terraform_remote_state.core_apps_compute.ase_name[0]}"
}

module "am-api" {
  source              = "git@github.com:hmcts/moj-module-webapp?ref=master"
  product             = "${var.product}-${var.component}"
  location            = "${var.location_app}"
  env                 = "${var.env}"
  ilbIp               = "${var.ilbIp}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  subscription        = "${var.subscription}"
  capacity            = "${var.capacity}"
  common_tags         = "${var.common_tags}"

  app_settings = {
    LOGBACK_REQUIRE_ALERT_LEVEL = "false"
    LOGBACK_REQUIRE_ERROR_CODE  = "false"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.product}-${var.env}"
  location = "${var.location_app}"

  tags = "${merge(var.common_tags,
      map("lastUpdated", "${timestamp()}")
      )}"
}
