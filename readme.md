1. First I create the root files (main,output,var,tfvars). and Define the goal e.g create an ec2 instance (a resource) and dependencies e.g vpc, subnets, sg etc
2. Then i create the project structure such as the modules
3. Then i deal with provider & backend, so define aws provider and backend do wwe do it locally or remote state.
4. Consider variables and inputs, and whether i'll need multiple environments. Dev, staging, prod? Impacts how variables are structured.
5. Consider outputs like whats necessary (public ips, instance IDs) and keep other outputs agnostic for module reuse.
6. Execution mindset, Ensure i know what terraform will do before it touches AWS.
7.


Define the ec2 purpose and what it is.
Cost optimization
EC2
t2.micro, AMI official amazon linux 2
EBS below 30GB.
SG has no extra cost
Key pair (created locally has no cost)

Problem solved.
#1 # Git Cleanup and Repository Preparation

During development, Terraform downloads provider binaries into the `.terraform/` folder.  
These files can be very large (hundreds of MBs) and **should never be committed to Git**, because:

- GitHub has a **100 MB file size limit** per file.  
- Including `.terraform` in commits bloats repository size and makes collaboration difficult.  

1. **Added `.gitignore`** 
2. Removed tracked .terraform files with
git rm -r --cached .terraform
git commit -m "Remove Terraform binaries from tracking"
3. Cleaned repo history since github still blocks large files in prev commits, a fresh branch repo was created to elimiante the provider binaries from the history.
4. Force pushed clean branch
Result
The repository is now ready for collaboration and deployment.