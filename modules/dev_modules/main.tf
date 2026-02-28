# resource "github_repository" "test_repos" {
resource "github_repository" "test_rep" {
  for_each    = var.repo_map
  name        = "my-tf-repo-${each.key}"
  description = "TFfor-each ${each.value.lang}"
  visibility  = "private"
  auto_init   = true
  # depends_on = [ github_repository_file.readmee ]
}
moved {
  from = github_repository.test_repos
  to   = github_repository.test_rep
}
data "github_user" "usr" {
  username = ""
}
# data "github_user" "current" {}

resource "github_repository_file" "readmee" {
  for_each   = var.repo_map
  repository = github_repository.test_rep[each.key].name
  branch     = "main"
  file       = "README.md"
  content = templatefile("${path.module}/templates/readm.tftpl", { 
    #path.module(current-module) path.cwd(till repo) path.root(. root)
    env  = var.env
    lang = each.value.lang
    repo = each.key
    # user = "sadashiv"
    user = data.github_user.usr.name
  })
  # content             = <<-EOT
  #                       This is a README file for TF var.env:${var.env}
  #                       each.value.lang:${each.value.lang} - each.key:${each.key} user:${data.github_user.usr.name}
  #                       EOT
  overwrite_on_create = true
  # lifecycle {
  #   ignore_changes = [ content ]
  # }
}
resource "github_repository_file" "customer_file" {
  for_each            = var.repo_map
  repository          = github_repository.test_rep[each.key].name
  branch              = "main"
  file                = each.value.filename
  content             = "# This is a each.value.lang:${each.value.lang} each.value.filename:${each.value.filename} file for each.key:${each.key} repository"
  overwrite_on_create = true
}
output "clone-urls-map" {
  #value = { for i in github_repository.test_rep[*] : i.name => i.http_clone_url }-- notworked 
  value = { for i in github_repository.test_rep : i.name => [i.ssh_clone_url, i.http_clone_url] }
  # value = {
  #   for k, v in github_repository.test_rep :
  #   v.name => v.http_clone_url
  # }
  description = "Repository names"
}