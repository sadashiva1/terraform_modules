terraform {
  backend "local" {
    path = "../tfstatefiles/terraform.tfstate"
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    #   export TF_VAR_github_token="ghp_xxxxxxxxxxxx"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  owner = "sadashiva1"
  token = var.github_token
}

variable "github_token" {
  type      = string
  sensitive = true
}