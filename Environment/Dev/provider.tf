terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
    backend "azurerm" {
      resource_group_name  = "DevOpsInsider"
      storage_account_name = "devstrg11"
      container_name       = "tfstate"
      key                  = "dev.terraform.tfstate"
  }

}


provider "azurerm" {
  features {}
}