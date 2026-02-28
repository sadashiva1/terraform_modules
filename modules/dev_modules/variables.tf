variable "repo_count" {
  description = "Number of repositories to create"
  type        = number
  default     = 1

  validation {
    condition     = var.repo_count < 5
    error_message = "Do not deploy more then 5 repos"
  }
}

variable "env" {
  description = "GitHub token with repo permissions"
  type        = string
  validation {
    # condition = var.env == "dev" || var.env == "prod"
    condition     = contains(["dev", "test", "staging", "prod"], var.env)
    error_message = "env must be one of dev, test, staging, prod"
  }
}

variable "repos" {
  type        = set(string)
  description = "Repositories"
  validation {
    condition     = length(var.repos) <= var.repo_max
    error_message = "Number of repositories exceeds the maximum allowed (${var.repo_max})"
  }
}

variable "repo_map" {
  type        = map(map(string))
  description = "map of map values"
}

variable "repo_max" {
  description = "Maximum number of repositories allowed"
  type        = number
  default     = 2
  validation {
    condition     = var.repo_max <= 6
    error_message = "Deploying more number of repos is not allowed"
  }

}
# variable "visibility" {
#   type = string
#   description = "Visibility of the GitHub repository"
#   default = var.env == "prod" ? "private" : "public"
#   # varible will use another variable and this needs local 
# }

# variable "varsource" {
#   type = string
#   description = "Source used to define"
#   default = "variable.tf"
# }