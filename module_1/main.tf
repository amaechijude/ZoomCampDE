terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "amaechizoomcamp"
  location = "EAST US"
}

resource "azurerm_storage_account" "sa" {
  name                     = "firstmodulestorage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "so" {
  name                 = "firstbucket"
  storage_account_name = azurerm_storage_account.sa.name
}

resource "azurerm_storage_data_lake_gen2_filesystem" "data_lake" {
  name               = "firstdatalake"
  storage_account_id = azurerm_storage_account.sa.id
}

variable "azure_sql_admin_password" {
  type      = string
  sensitive = true
}
variable "azure_sql_admin_user" {
  type      = string
  sensitive = true
}


resource "azurerm_synapse_workspace" "synapse" {
  name                                 = "amaechi-synapse-workspace"
  resource_group_name                  = azurerm_resource_group.rg.name
  location                             = "  EAST US"
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.data_lake.id
  sql_administrator_login              = var.azure_sql_admin_user
  sql_administrator_login_password     = var.azure_sql_admin_password

  identity {
    type = "SystemAssigned"
  }
}