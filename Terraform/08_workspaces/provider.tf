# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.9.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "NextOps"  
    storage_account_name = "nextopstfsat20"                      
    container_name       = "tfstate"                       
    key                  = "terraform.tfstate"     
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}

  subscription_id = "xxxxxx-xxxxxxxxx-xxxxxxxx-xxxxxxxxxxxxx"
}