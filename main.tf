# Create resource group
resource "azurerm_resource_group" "dev" {
  name     =  "3-tier-architecture"
  location = "eastus"
}

# Create networking resources
module "networking" {
    source = "./modules/network"
    resource_group = azurerm_resource_group.dev.name
    location = azurerm_resource_group.dev.location
    vnet_cidr = ["10.0.0.0/16"]
    web_subnet_cidr = ["10.0.1.0/24"]
    app_subnet_cidr = ["10.0.2.0/24"]
    db_subnet_cidr = ["10.0.3.0/24"]

}

# Create network security groups
module "securitygroup" {
  source         = "./modules/nsgroup"
  location       = azurerm_resource_group.dev.location
  resource_group = azurerm_resource_group.dev.name
  web_subnet_id  = module.networking.web_subnet_id
  app_subnet_id  = module.networking.app_subnet_id
  db_subnet_id   = module.networking.db_subnet_id
}

# Create compute resources
module "compute" {
  source         = "./modules/compute"
  location = azurerm_resource_group.dev.location
  resource_group = azurerm_resource_group.dev.name
  
  sku = "Dsv3"

  web_subnet_id = module.networking.web_subnet_id
  web-ip = module.ip.web-ip

  app_subnet_id = module.networking.app_subnet_id

  username = "Sourav"
  password = "Alpha@123"


}

# Create db server and db
module "database" {
  source = "./modules/db"
  location = azurerm_resource_group.dev.location
  resource_group = azurerm_resource_group.dev.name
  data-subnet-id = module.networking.db_subnet_id

  dev_database = "sql-dev-database"
  dev_database_version = "12.0"
  dev_database_admin = "db-admin"
  dev_database_password = "admin@1234"
}


module "ip" {
  source = "./modules/ip"
  resource_group = azurerm_resource_group.dev.name
  location = azurerm_resource_group.dev.location
}