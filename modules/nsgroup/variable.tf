variable "resource_group" {
    description = "resource group of the virtual network"
    type = string
}   

variable "location" {
    description = "location of the virtual network" 
    default = "eastus"
    type = string
}

variable "web_subnet_id" {
    description = "address of the web subnet"
    type = string
}

variable "app_subnet_id" {
    description = "address of the app subnet"
    type = string
}

variable "db_subnet_id" {
    description = "address of the db subnet"
    type = string
}