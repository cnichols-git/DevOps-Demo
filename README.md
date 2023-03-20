# DevOps-Demo

To do list:  
- ~~Set up git repo~~  
- Choose if or what software to use for the site  
- Setup DNS again using Terraform  
- Configure the droplet (user account, SSH keys, install nginx, etc...) using Ansible  
- Create/edit the static site code locally on your machine, check the code into GitHub  
- Setup GitHub Actions to push the generated site to the droplet on every commit  
<p>Once this is all set up I can edit locally and push approved changes to master, which will trigger a Github action that will update the site.</p>  

- Make a list off all the software being used to achieve this task  
- Make a visual map of how the process flow looks  
- Document how to properly shutdown a AWS instance with terraform  


<p>For the Terraform the following steps are needed</p>  

<ol>
<li>Create VPC</li>
<li>Create Internet Gateway</li>
<li>Create Custom route table</li>
<li>Create subnet</li>
<li>Associate subnet with route table</li>
<li>Create Security Group to allow ports 22,80 and 443</li>
<li>reate a network interface with an ip in the subnet that was created in step 4</li>
<li>Assign an elastic IP to the network interface created in step </li>
<li>Create Ubuntu server and install/enable ngnix</li>
</ol>