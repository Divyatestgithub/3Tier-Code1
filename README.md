# 3Tier-Code1


Three-Tier Architecture in AWS
Presentation Tier
Application Tier
Database Tier
Three-tier architecture is a well-established software application architecture that organizes applications into three logical and physical computing tiers: the presentation tier, or user interface; the application tier, where data is processed; and the data tier, where the data associated with the application is stored and managed.

Configure Provider
Providers are plugins that Terraform requires so that it can install and use for your Terraform configuration. Terraform offers the ability to use a variety of Providers, so it doesn’t make sense to use all of them for each file. We will declare our Provider as AWS.

Website Script
A file named install_apache.sh is present , it will install an Apache web server on our instances and create a unique landing page for each so we can verify the Application Load Balancer is working.

Configure terraform files for all the resources
Create a single main.tf file and add each of the resouces sections to the main.tf file or create individual resource files as in our case. From the terminal in the Terraform directory containing install_apache.sh and main.tf run terraform init

VPC and Subnets, Internet Gateway and Route Table : main.tf
Web Servers : ec2.tf
Security Groups : sg.tf
Application Load Balancer : alb.tf
RDS Instance :db.tf
Variable File : var.tf
Output : output.tf
Enviornmnet variable file : dev.tfvars
Provision Infrastructure
Run terminal run terraform init . Run terraform fmt . This ensures your formatting is correct and will modify the code for you to match. Run terraform validate to ensure there are no syntax errors. Run terraform plan to see what resources will be created. Run terraform apply to create your infrastructure. Type Yes when prompted.
