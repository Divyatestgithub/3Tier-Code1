resource "azurerm_network_interface" "appinterface" {
  count=  var.number_of_machines
  name                = "appinterface${count.index}"
  location            = var.location  
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetA.id
    private_ip_address_allocation = "Dynamic"    
  }

  depends_on = [
    azurerm_virtual_network.appnetwork
  ]
}

resource "azurerm_linux_virtual_machine" "appvm" {
   count=  var.number_of_machines
  name                = "appvm${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
   availability_set_id = azurerm_availability_set.appset.id
    network_interface_ids = [
    azurerm_network_interface.appinterface[count.index].id,
  ]


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
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  depends_on = [
    azurerm_virtual_network.appnetwork,
    azurerm_network_interface.appinterface,
        azurerm_availability_set.appset
  ]
}

resource "null_resource" remoteExecProvisionerWFolder {

  provisioner "remote-exec" {
    inline = [

        "sudo apt-get install -y python3-pip",
        "sudo apt-get install build-essential libssl-dev libffi-dev python-dev",
        
        "mkdir /var/www/app",

        # creating python virtual enviornment & activating.
        "pip3 install virtualenv",
        "python3 -m venv /var/wwww/app/venv",
        "source /var/wwww/app/venv/bin/activate",

        "pip install -r /var/wwww/app/requirements.txt",

        "python /var/wwww/app/app.py"

    ]
  }

  provisioner "file" {
    source      = "./app/app.py"
    destination = "/var/wwww/app/app.py"
  }
  provisioner "file" {
    source      = "./app/requirements.txt"
    destination = "/var/wwww/app/requirements.txt"
  }

  connection {
    count=  var.number_of_machines
    host     = "${azurerm_virtual_machine.appvm[count.index].ip_address}"
    type     = "ssh"
    user     = "adminuser"
    private_key = file("~/.ssh/id_rsa.pem")
    agent    = "false"
  }
  depends_on = [
    azurerm_linux_virtual_machine.appvm ]
}
