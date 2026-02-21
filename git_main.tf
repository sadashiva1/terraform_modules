resource "random_id" "random1" {
  byte_length = 2
  count       = 2
}


resource "github_repository" "terraform_repo" {
  name        = "terraform_modules1"
  # name        = "terraform_modules1-${random_id.random1[1].dec}"
  # name        = "terraform_modules1-${random_id.random1[1].dec}"
  
  # count = 2
  # name  = "terraform_modules1-${random_id.random1[count.index].dec}"

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
  repository          = github_repository.terraform_repo.name
  branch              = "test_branch"
  file                = "README.md"
  content             = "# Terraform Repository - for infra dev team"
  overwrite_on_create = true
}