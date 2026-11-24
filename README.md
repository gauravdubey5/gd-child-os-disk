# gd-child-os-disk: Azure Managed Disk Terraform Module

This child module creates and manages standalone Azure Managed Disks (OS and data disks) and optional VM attachments.

Part of the **Azure Parent–Child Infrastructure Architecture** under GitHub account `gauravdubey5`.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `managed_disks` | Mapping of managed disk configurations | `any` | `{}` | yes |

## Outputs

| Name | Description |
|------|-------------|
| `managed_disks` | The created Managed Disks |
