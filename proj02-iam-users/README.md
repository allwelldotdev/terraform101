# Deployed IAM User Management on AWS using Terraform from YAML file

In this project, I learned how to deploy and manage AWS IAM users using Terraform from a YAML file.

- To begin, I created a YAML file `user-roles.yaml`. The file contains a 'users' object with 'username' and 'roles' key-value pairs.
- Fetched the data from the file into my Terraform project using the `yamldecode()` function, and stored values in a `local` variable.
- Used the username values in local variable to create users in AWS.
- Used `aws_iam_user_login_profile` to create and assign passwords to the users. Here, just for tutorial sake, I outputted the passwords to the Terraform console (**this should never be done in the real world to ensure the safety of the codebase and infrastructure**).
- Created AWS IAM roles using roles I mapped from YAML file, restructured the data, and stored in another local variable.
- Defined assume role policies for each role. This was quite the learning execise. Here, I used the Terraform data resource/attribute to fetch data on managed policies from AWS and attached those policies using `aws_iam_role_policy_attachment` to the created roles.
- To complete the project, I restricted the principals who could assume the role policies to the respective users via their respective roles (as stated in the YAML file).

This project taught me to create Terraform IAC code files that manage AWS IAM users and roles. This skill would be valuable when working with a Cloud/DevOps/SRE team.
