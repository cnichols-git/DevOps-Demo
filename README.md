# DevOps-Demo  

## Things to know before you begin

<p>For this to work you will need to have AWS set up with an account that allows you to create EC2 isntances.</p>
<p>You will need aws-cl and terraform installed</p>  
<p>You will need to **Never** put your AWS access key or access token git as it will be noticed by AWS and they will apply a security rule on your account to prevent malicous activity on your account</p>  
<p>Set up a .aws credential folder by running the command <code>aws configure</code></p>
[link to the aws-cli set up](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)


To do list:  
- ~~Set up git repo~~  
- Choose if or what software to use for the site  
- Setup DNS again using Terraform  
- Configure the droplet (user account, SSH keys, install nginx, etc...) using Ansible  
- Create/edit the static site code locally on your machine, check the code into GitHub  
- Setup GitHub Actions to push the generated site to the droplet on every commit  
<p>Once this is all set up I can edit locally and push approved changes to master, which will trigger a Github action that will update the site.</p>  


<h2>For Terraform the following steps are needed</h2>  

1. Create VPC
2. Create Internet Gateway
3. Create Custom route table
4. Create subnet
5. Associate subnet with route table
6. Create Security Group to allow ports 22,80 and 443
7. reate a network interface with an ip in the subnet that was created in step 4
8. Assign an elastic IP to the network interface created in step
9. Create Ubuntu server and install/enable ngnix

<p>My to do list:</p>  

- Make a list off all the software being used to achieve this task  
- Make a visual map of how the process flow looks  
- Document how to properly shutdown a AWS instance with terraform  
- document all the things  