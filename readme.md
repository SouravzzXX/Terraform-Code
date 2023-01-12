This contains 3 tier deployment of an app inside azure. This virtual network has 3 subnets for each tier. The nsg rules defined are as follows:

For the Web NSG, we are allowing  inbound traffic to the outside world but restricting access to db subnet. 
For the app NSG, we are denying all inbound traffic and allowing inbound and outbound traffic to web subnet
for the db NSG, we deny all inbound traffic, allow inbound traffic from app NSG only and allow outbound traffic to app subnet.