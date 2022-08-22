output "azurerm_storage_account" {
  value = azurerm_storage_account.sa
}

output "azurerm_network_security_group" {
  value = azurerm_network_security_group.nsg
}

output "azurerm_network_watcher" {
  value = azurerm_network_watcher.nw
}

output "azurerm_log_analytics_workspace" {
  value = azurerm_log_analytics_workspace.log_analytics
}

output "azurerm_network_watcher_flow_log" {
  value = azurerm_network_watcher_flow_log.flow_log
}
