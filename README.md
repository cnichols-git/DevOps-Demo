# DevOps-Demo

#Let's clean this up

Nine steps to creating a Terrafrom file to launch an AWS instance with Apache installe as a webserver. 

#1. Create VPC  
#2. Create Internet Gateway  
#3. Create Custom route table  
#4. Create subnet  
#5. Associate subnet with route table  
#6. Create Security Group to allow ports 22,80 and 4  
#7. Create a network interface with an ip in the subnet that was created in step 4  
#8. Assign an elastic IP to the network interface created in step  
#9. Create Ubuntu server and install/enable ngnix  

## Lessons Learned

- Know that you can never add AWS credientals in Github as they will detect this and put a security group on your account and prevent you from successfully making changes with Terrafom
