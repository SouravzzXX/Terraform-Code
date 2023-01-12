variable "resource_group" {
    description = "resource group of db"
    type = string
}   

variable "location" {
    description = "location of db" 
    default = "eastus"
    type = string
}

variable "dev_database" {
    description = "db name"
    type = string
}

variable "dev_database_version" {
    description = "version of database"
    type = string
}

variable "dev_db_admin" {
    description = "database admin login"
    type = string
}

variable "dev_db_password" {
    description = "admin login password"
    type = string
}

variable "data-subnet-id" {
  description = "database subnet ID"
  type = string
}