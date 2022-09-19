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

variable "account_tier" {
  type        = string
  description = "Defines the Tier to use for this storage account. For BlockBlobStorage and FileStorage accounts only Premium is valid."
  default     = "Standard"
}

variable "account_kind" {
  type        = string
  description = "Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2"
  default     = "StorageV2"
}

variable "account_replication_type" {
  type        = string
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
  default     = "LRS"
}

variable "sku" {
  type        = string
  description = "(optional) describe your variable"
  default     = "PerGB2018"
}