resource "azurerm_resource_group" "rg" {
  name     = "dev-dns-rg"
  location = var.azure_location
}

resource "azurerm_dns_zone" "dev_zone" {
  name                = var.domain_name
  resource_group_name = azurerm_resource_group.rg.name
}

# Networking boilerplate
resource "azurerm_virtual_network" "vnet" {
  name                = "dev-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "dev-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "pip" {
  name                = "dev-vm-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "nic" {
  name                = "dev-vm-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "dev_vm" {
  name                = "azure-dev-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B2s"
  admin_username      = "adminuser"
  network_interface_ids = [azurerm_network_interface.nic.id]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  identity { type = "SystemAssigned" }
  tags     = { Environment = "Dev" }
}

resource "azurerm_role_assignment" "vm_dns_permission" {
  scope                = azurerm_dns_zone.dev_zone.id
  role_definition_name = "DNS Zone Contributor"
  principal_id         = azurerm_linux_virtual_machine.dev_vm.identity.0.principal_id
}

resource "azurerm_virtual_machine_extension" "dns_updater" {
  name                 = "dns-boot-updater"
  virtual_machine_id   = azurerm_linux_virtual_machine.dev_vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = <<SETTINGS
    {
        "script": "${base64encode(templatefile("${path.module}/azure_startup.sh", { ZONE_NAME = var.domain_name }))}"
    }
  SETTINGS
}
