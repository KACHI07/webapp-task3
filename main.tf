terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.31.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {
  }

}
resource "azurerm_resource_group" "rg" {
  name     = "WebAppX-rg"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "asp" {
  name                = "WebAppX-asp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  kind = "linux"
  reserved = true

  sku {
    tier = "Standard"
    size = "S1"
  }

   tags = {
    creator = "Babayega"

  }
}

resource "azurerm_app_service" "as" {

   name               = "WebAppX-as"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

   site_config {
    linux_fx_version = "DOCKER|nginx:latest"
  }



  tags = {
    image = "nginx"

  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }

}

resource "azurerm_app_service" "as1" {

   name               = "WebAppX-as1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

   site_config {
    linux_fx_version = "DOCKER|wordpress:latest"
  }



  tags = {
    image = "wordpress"

  }

connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
  

}
resource "azurerm_app_service" "as2" {

   name               = "WebAppX-as2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

   site_config {
    linux_fx_version = "DOCKER|percona"
  }



  tags = {
    image = "percona"

  }

connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
  

}

