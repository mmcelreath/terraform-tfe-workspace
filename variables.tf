variable "workspace_name" {
  type = string
  description = "(Required) Name of the workspace"
}

variable "organization" {
  type = string
  description = "(Required) Name of the organization."
}

variable "description" {
  type    = string
  description = "(Optional) A description for the workspace."
  default = null
}

variable "allow_destroy_plan" {
  type    = bool
  description = "(Optional) Whether destroy plans can be queued on the workspace."
  default = null
}

variable "auto_apply" {
  type    = bool
  description = "(Optional) Whether to automatically apply changes when a Terraform plan is successful. Defaults to false."
  default = null
}

variable "execution_mode" {
  type    = string
  description = "(Optional) Which execution mode to use. Using Terraform Cloud, valid values are remote, local oragent. Defaults to remote. Using Terraform Enterprise, only remoteand local execution modes are valid. When set to local, the workspace will be used for state storage only. This value must not be provided if operations is provided."
  default = null
}

variable "structured_run_output_enabled" {
  type    = bool
  description = "(Optional) Whether this workspace should show output from Terraform runs using the enhanced UI when available. Defaults to true. Setting this to false ensures that all runs in this workspace will display their output as text logs."
  default = null
}

variable "terraform_version" {
  type    = string
  description = "(Optional) The version of Terraform to use for this workspace. This can be either an exact version or a version constraint (like ~> 1.0.0); if you specify a constraint, the workspace will always use the newest release that meets that constraint. Defaults to the latest available version."
  default = null
}

variable "vcs_repo" {
  type        = map(string)
  description = <<-EOT
    Map of Version Control settings for VCS workflows.
    example:
    vcs_repo = {
      identifier         = "repo/path" #Required
      branch             = "main"      #Optional
      ingress_submodules = "false"     #Optional
      oauth_token_id     = "xxxxxxxx"  #Required
    }
  EOT
  default     = null
}

variable "workspace_vars" {
  type = map(object(
    {
      value     = string
      category  = string
      sensitive = bool
    }
  ))
  description = <<-EOT
    Map of Environment variable(s) to be added to workspace.
    example:
    workspace_vars = {
      env_var = {
        value    = "NonSensitiveValue"
        category = "env"
        sensitive = false
      }
      terraform_var = {
        value     = "**SensitiveValue**"
        category  = "terraform"
        sensitive = true
      }
    }
  EOT
  default     = null
}
