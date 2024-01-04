# kind-terraform
Project to create a kind local kubernetes cluster and install flux.

1. Create a github access token(https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) with the following permissions:
    ![Alt text](images/github_permissions.png)
2. Copy the access token from the previous step and set it as terraform environment variable:
    ```
    # export TF_VAR_github_token=<your_personal_token>
    # export TF_VAR_github_project=<your_github_project>
    # export TF_VAR_github_username=<your_github_username>
    ```
3. Run terraform to create the cluster and install flux:
    ```
    # cd terraform
    # terraform init
    # terraform plan
    # terraform apply
    ```