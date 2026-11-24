resource "azurerm_managed_disk" "disks" {
  for_each             = var.managed_disks
  name                 = each.value.name
  location             = each.value.location
  resource_group_name  = each.value.resource_group_name
  storage_account_type = lookup(each.value, "storage_account_type", "Standard_LRS")
  create_option        = lookup(each.value, "create_option", "Empty")
  disk_size_gb         = lookup(each.value, "disk_size_gb", 30)
  zone                 = lookup(each.value, "zone", null)
  tags                 = lookup(each.value, "tags", {})
}

resource "azurerm_virtual_machine_data_disk_attachment" "attachments" {
  for_each           = { for k, v in var.managed_disks : k => v if lookup(v, "virtual_machine_id", null) != null }
  managed_disk_id    = azurerm_managed_disk.disks[each.key].id
  virtual_machine_id = each.value.virtual_machine_id
  lun                = lookup(each.value, "lun", 0)
  caching            = lookup(each.value, "caching", "ReadWrite")
}
