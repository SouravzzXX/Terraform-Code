variable "resource_group" {
    description = "resource group of v.m"
    type = string
}   

variable "location" {
    description = "location of v.m" 
    default = "eastus"
    type = string
}

variable "web_subnet_id" {
    description = "id of the web subnet"
    type = string
}

variable "app_subnet_id" {
    description = "id of the app subnet"
    type = string
}

variable "sku" {
    description = "vm config"
    type = string 
}

variable "username" {
    description = "username"
    type = string
}

variable "password" {
    description = "password"
    type = string
}

variable "web-ip" {
    description = "private IP for Web VM"
    type = string
}