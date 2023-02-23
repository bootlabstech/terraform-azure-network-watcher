resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "test1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "test2"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "test3"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "test4"
    priority                   = 103
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Udp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_watcher" "nw" {
  name                = var.nw_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_storage_account" "sa" {
  name                = var.sa_name
  resource_group_name = var.resource_group_name
  location            = var.location

  account_tier              = var.account_tier
  account_kind              = var.account_kind
  account_replication_type  = var.account_replication_type
  enable_https_traffic_only = true
}

resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.log_analytics_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
}

resource "azurerm_network_watcher_flow_log" "flow_log" {
  network_watcher_name = azurerm_network_watcher.nw.name
  resource_group_name  = var.resource_group_name
  name                 = var.flow_log_name

  network_security_group_id = azurerm_network_security_group.nsg.id
  storage_account_id        = azurerm_storage_account.sa.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 7
  }

  traffic_analytics {
    enabled               = true
    workspace_id          = azurerm_log_analytics_workspace.log_analytics.workspace_id
    workspace_region      = azurerm_log_analytics_workspace.log_analytics.location
    workspace_resource_id = azurerm_log_analytics_workspace.log_analytics.id
    interval_in_minutes   = 10
  }
}
