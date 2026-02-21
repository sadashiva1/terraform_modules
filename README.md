# terraform_modules

This repository contains reusable Terraform modules used across projects.

**Purpose:** Provide well-documented, versioned modules for common cloud infrastructure (networking, compute, storage, IAM, etc.). Each module lives in its own subdirectory and is intended to be consumable both locally and from a module registry or Git.

**Table of Contents**
- Modules
- Usage
- Development
- Testing & CI
- Versioning & Releases
- Contributing
- License

**Modules**
- Place each module under `modules/<module-name>/` and include a module-level `README.md`, `variables.tf`, `outputs.tf`, and `main.tf` (or split into logical files).
- Example structure:

	modules/
	- vpc/
		- main.tf
		- variables.tf
		- outputs.tf
		- README.md
	- s3/

**Usage**
- Local (for testing):

	module "vpc" {
		source = "./modules/vpc"
		# provide required inputs
	}

- From Git (tagged release):

	module "vpc" {
		source = "git::ssh://git.example.com/org/terraform_modules.git//modules/vpc?ref=v1.2.0"
	}

- From a registry (when published):

	module "vpc" {
		source  = "registry.example.com/org/vpc/aws"
		version = "~> 1.2"
	}

**Inputs & Outputs**
- Document all module inputs in `variables.tf` with descriptions and sensible defaults.
- Document outputs in `outputs.tf` with clear descriptions for consumers.

**Development**
- Format: `terraform fmt -recursive`
- Validate: `terraform init && terraform validate`
- Plan (example): `terraform plan -var-file=examples/dev.tfvars`

**Testing & CI**
- Recommended checks in CI:
	- `terraform fmt -check`
	- `terraform init -backend=false` + `terraform validate`
	- `tflint`, `checkov` or similar static analysis tools
	- Unit/integration tests: use Terratest or similar for automated tests

**Versioning & Releases**
- Use semantic versioning (tags like `v1.0.0`).
- Update module `README.md` and changelog when releasing.

**Contributing**
- Fork → feature branch → open PR.
- Include changelog entry and update module `README.md` for new/changed inputs.

**License**
- Add your preferred license file (e.g., `LICENSE`) at repo root.

If you want, I can:
- Add example `modules/vpc` with a minimal working example.
- Add a GitHub Actions CI workflow to run `fmt`, `validate`, and `tflint`.
