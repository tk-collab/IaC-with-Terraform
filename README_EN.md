# IaC-with-Terraform
## The difference from CFn
### 1. Vender free
  - Available for except for AWS
### 2. Stack free
  - Available for partial deletion etc.
### 3. Execute "terraform fmt", "terraform validate", "terraform plan", and then "terraform apply" in order.
### 4. Build multiple environment
    - modules
    - workspaces
      - Use when we want to separate dev from prod.
### 5. Manage tfstate file separated from directry(for preventing it from acceidental deletion)
  - Restore in S3, DynamoDB for lock management

## Difficulties
### Not pushed due to over capacity of Provider folder, even though using .gitignore.
### Necessary files have been deleted when I used git filter-repo command. In such a situation, we should have used --invert-paths option. 