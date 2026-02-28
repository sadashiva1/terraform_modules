# # for-eachloop
# resource "github_repository" "my_tf_repos" {
#   # for_each    = toset(["dev","prod"])
#   for_each    = var.repos
#   name        = "my-tf-repo-${each.key}"
#   description = "this repo created using for each loop terraform- key:${each.key} value:${each.value}"
#   visibility  = "private"
#   auto_init   = true
#   depends_on = [ github_repository_file.readme ]
#   provisioner "local-exec" {
#     command = "ls" 
#   }
# }
# resource "github_repository_file" "readme" {
#   for_each   = var.repos
#   repository = github_repository.my_tf_repos[each.key].name
#   branch     = "main"
#   file       = "README.md"
#   content    = "# Terraform Repository - for infra dev team - ${each.key}"
#   overwrite_on_create = true
# }

##==================x=========================
# resource "random_id" "random1" {
#   byte_length = 2
#   # count       = 2
#   count = var.repo_count
# }
# resource "github_repository" "terraform_repo" {
#   # name        = "terraform_modules1"
#   # name        = "terraform_modules1-${random_id.random1[1].dec}"
#   # name        = "terraform_modules1-${random_id.random1[1].dec}"
#   count       = var.repo_count
#   name        = "terraform_modules1-${random_id.random1[count.index].dec}"
#   description = "Decription of the repository- updated via terraform code"
#   visibility  = "private"
#   # visibility = var.env == "prod" ? "public" : "private"
#   auto_init   = true
#   #   private     = false
# }
# resource "github_repository_file" "readme" {
#   count      = var.repo_count
#   repository = github_repository.terraform_repo[count.index].name
#   # branch              = "test_branch"
#   branch              = "main"
#   file                = "README.md"
#   content             = "# Terraform Repository - for infra dev team"
#   overwrite_on_create = true
# }
# resource "github_repository_file" "index" {
#   count      = var.repo_count
#   repository = github_repository.terraform_repo[count.index].name
#   # branch              = "test_branch"
#   branch              = "main"
#   file                = "index.html"
#   content             = "<html><body><h1>Terraform Repository - for infra dev team</h1></body></html>"
#   overwrite_on_create = true
# }

# output "clone-urls" {

#   # value       = github_repository.terraform_repo[*].name
#   value = { for i in github_repository.terraform_repo[*] : i.name => i.http_clone_url }
#   # [for i in github_repository.terraform_repo[*] : "${i.name} : ${i.http_clone_url}" ]
#   # [for i in github_repository.terraform_repo[*] : "${i.name} : ${i.http_clone_url}" ][0]
#   description = "REpository names"
#   sensitive   = false #hide from terminal- but visible in tfstate files
# }

# # output "varsource" {
# #   value = var.varsource
# #   description = "Source used to define"
# # }

# # resource "github_branch" "test" {
# #   repository = github_repository.terraform_repo.name
# #   branch     = "test_branch"
# # }
