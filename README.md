<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_variable.var](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_workspace.workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_destroy_plan"></a> [allow\_destroy\_plan](#input\_allow\_destroy\_plan) | (Optional) Whether destroy plans can be queued on the workspace. | `bool` | `null` | no |
| <a name="input_auto_apply"></a> [auto\_apply](#input\_auto\_apply) | (Optional) Whether to automatically apply changes when a Terraform plan is successful. Defaults to false. | `bool` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) A description for the workspace. | `string` | `null` | no |
| <a name="input_execution_mode"></a> [execution\_mode](#input\_execution\_mode) | (Optional) Which execution mode to use. Using Terraform Cloud, valid values are remote, local oragent. Defaults to remote. Using Terraform Enterprise, only remoteand local execution modes are valid. When set to local, the workspace will be used for state storage only. This value must not be provided if operations is provided. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) Name of the workspace | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | (Required) Name of the organization. | `string` | n/a | yes |
| <a name="input_structured_run_output_enabled"></a> [structured\_run\_output\_enabled](#input\_structured\_run\_output\_enabled) | (Optional) Whether this workspace should show output from Terraform runs using the enhanced UI when available. Defaults to true. Setting this to false ensures that all runs in this workspace will display their output as text logs. | `bool` | `null` | no |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | (Optional) The version of Terraform to use for this workspace. This can be either an exact version or a version constraint (like ~> 1.0.0); if you specify a constraint, the workspace will always use the newest release that meets that constraint. Defaults to the latest available version. | `string` | `null` | no |
| <a name="input_vcs_repo"></a> [vcs\_repo](#input\_vcs\_repo) | Map of Version Control settings for VCS workflows.<br>example:<br>vcs\_repo = {<br>  identifier         = "repo/path" #Required<br>  branch             = "main"      #Optional<br>  ingress\_submodules = "false"     #Optional<br>  oauth\_token\_id     = "xxxxxxxx"  #Required<br>} | `map(string)` | `null` | no |
| <a name="input_workspace_vars"></a> [workspace\_vars](#input\_workspace\_vars) | Map of Environment variable(s) to be added to workspace.<br>example:<br>workspace\_vars = {<br>  env\_var = {<br>    value    = "NonSensitiveValue"<br>    category = "env"<br>    sensitive = false<br>  }<br>  terraform\_var = {<br>    value     = "**SensitiveValue**"<br>    category  = "terraform"<br>    sensitive = true<br>  }<br>} | <pre>map(object(<br>    {<br>      value     = string<br>      category  = string<br>      sensitive = bool<br>    }<br>  ))</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_workspace"></a> [workspace](#output\_workspace) | Outputs the values returned by the tfe\_workspace resource. https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace |
<!-- END_TF_DOCS -->