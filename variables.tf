variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "location" {
  type        = string
  description = "location of the resource group"
}

variable "sa_name" {
  type        = string
  description = "name of the azurerm_storage_account"
}

variable "nsg_name" {
  type        = string
  description = "name of the azurerm_network_security_group"
}

variable "nw_name" {
  type        = string
  description = "name of the azurerm_network_watcher"
}

variable "log_analytics_name" {
  type        = string
  description = "name of the azurerm_log_analytics_workspace"
}

variable "flow_log_name" {
  type        = string
  description = "name of the azurerm_network_watcher_flow_log"
}
