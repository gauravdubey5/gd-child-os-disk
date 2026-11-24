output "managed_disks" {
  description = "The created Managed Disks."
  value       = azurerm_managed_disk.disks
}
