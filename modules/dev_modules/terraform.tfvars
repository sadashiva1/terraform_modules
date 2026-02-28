repo_count = 1
# varsource = "terraform.tfvars"
env      = "dev"
repos    = ["dev", "prod"]
repo_max = 2
repo_map = {
  infra = {
    lang     = "terraform",
    filename = "main.tf"
  },
  backend = {
    lang     = "python",
    filename = "main.py"
  }
}