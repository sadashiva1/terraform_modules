resource "github_repository" "terraform_repo" {
  name        = "terraform_modules1"
  description = "Decription of the repository- updated via terraform code"
  visibility  = "private"
  auto_init   = true
  #   private     = false
}

resource "github_branch" "test" {
  repository = github_repository.terraform_repo.name
  branch     = "test_branch"
}

resource "github_repository_file" "readme" {
  repository = github_repository.terraform_repo.name
  branch = "test_branch"
  file       = "README.md"
  content    = "# Terraform Repository - for infra dev team"
  overwrite_on_create = true
}