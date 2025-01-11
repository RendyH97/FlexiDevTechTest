# Vue.js Application Deployment to Azure App Service

This repository contains the Vue.js source code, Dockerfile, Nginx configuration, and GitHub Actions workflow for deploying the application as a Linux container to Azure App Service.

## Prerequisites

Before you start, ensure you have the following:
- An Azure Service Principal for deployment.
- DockerHub credentials (or any other container registry you're using).
- GitHub Actions enabled for your repository.

## Step 1: Add Azure Service Principal Credentials to GitHub Secrets

You will need to create a Service Principal in Azure and add its credentials to your GitHub repository secrets. Follow these steps:

1. In your repository, navigate to **Settings** > **Secrets and variables** > **Actions**.
2. Click **New repository secret**.
3. Name your secret `AZURE_CREDENTIALS` and paste the JSON object with your Azure Service Principal credentials. Example:

    ```json
    {
      "clientSecret": "your password of service principal",
      "subscriptionId": "subscription id",
      "tenantId": "your tenant id",
      "clientId": "your app id of service principal"
    }
    ```

This secret will be used by the GitHub Actions workflow to authenticate with Azure for deployment.

## Step 2: Create Docker Login Token and Add to GitHub Secrets

To push your Docker image, you need to authenticate with your container registry. Here's how you can set it up:

1. Generate a personal access token (PAT) on GitHub for Docker login by following [GitHub's guide](https://docs.docker.com/security/for-developers/access-tokens/#create-an-access-token).
2. Add the following secrets to your repository secret:
   - **REGISTRY_TOKEN**: Your Docker login token.
   - **REGISTRY_USERNAME**: Your Docker username.

These secrets will be used by GitHub Actions for pushing the Docker image to the container registry.

## Step 3: Continuous Deployment with GitHub Actions

The source code will be deployed as a Linux container to Azure App Service through a CI/CD pipeline using GitHub Actions. The workflow is triggered automatically when changes are pushed to the `main` branch or manually triggered through the Actions tab.

### Key Features of the CI/CD Pipeline:
- **Automatic Deployment**: Deploys the application when a new commit is pushed to the `main` branch.
- **Manual Deployment**: You can trigger the workflow manually from GitHub Actions.

Refer to the `.github/workflows/main.yml` file for details about the CI/CD pipeline configuration.

## Step 4: Application Architecture

The following image illustrates the high-level architecture of the Azure App Service deployment:

![Azure App Service Architecture](images/app%20service%20azure%20architecture.png)

## Conclusion

By following the steps outlined above, you can seamlessly deploy your Vue.js application to Azure App Service using Docker and GitHub Actions. For more information and resources used in this project, refer to the following documentation:

- [Deploy a custom container to App Service using GitHub Actions](https://learn.microsoft.com/en-us/azure/app-service/deploy-container-github-action?tabs=service-principal)
- [Deploy Vue.js using nginx inside of docker](https://cli.vuejs.org/guide/deployment.html#docker-nginx)
- [Passing data between jobs in a workflow](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/storing-and-sharing-data-from-a-workflow#passing-data-between-jobs-in-a-workflow)
- [Github Action - Checkout](https://github.com/actions/checkout)
- [Github Action - Setup Node](https://github.com/actions/setup-node)
- [Github Action - Upload Artifact](https://github.com/actions/upload-artifact)
- [Github Action - Download Artifact](https://github.com/actions/download-artifact)
- [Github Action - Docker Login](https://github.com/docker/login-action)
- [Github Action - Azure Login](https://github.com/Azure/login)
- [Github Action - App Service Deploy](https://github.com/Azure/webapps-deploy)