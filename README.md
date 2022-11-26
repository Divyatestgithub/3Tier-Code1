# 3Tier-Code1


Three-Tier Architecture in Azure
Loadbalancer Tier -->like a webserver which directs the traffic to backend pools
Application Tier -->on vm application is hosted
Database Tier
Three-tier architecture is a well-established software application architecture that organizes applications into three logical and physical computing tiers: the presentation tier, or user interface; the application tier, where data is processed; and the data tier, where the data associated with the application is stored and managed.

Configure Provider
Providers are plugins that Terraform requires so that it can install and use for your Terraform configuration. Terraform offers the ability to use a variety of Providers, so it doesn’t make sense to use all of them for each file. We will declare our Provider as Azurerm.


AvailabilitySet.tf
env.tfvars
loadbalancer.tf
networking.tf
provider.tf
resourcegroup.tf
sqldatabase.tf
variables.tf
virtualmachine.tf

Run terminal run terraform init . Run terraform fmt . This ensures your formatting is correct and will modify the code for you to match. Run terraform validate to ensure there are no syntax errors. Run terraform plan to see what resources will be created. Run terraform apply to create your infrastructure. Type Yes when prompted.
