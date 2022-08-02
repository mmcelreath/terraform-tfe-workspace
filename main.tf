resource "tfe_workspace" "workspace" {
  name                          = var.workspace_name
  organization                  = var.organization
  description                   = var.description
  allow_destroy_plan            = var.allow_destroy_plan
  auto_apply                    = var.auto_apply
  terraform_version             = var.terraform_version
  structured_run_output_enabled = var.structured_run_output_enabled
  execution_mode                = var.execution_mode

  dynamic "vcs_repo" {
    for_each = lookup(var.vcs_repo, "identifier") == null ? [] : [var.vcs_repo]
    content {
      identifier         = lookup(var.vcs_repo, "identifier", null)
      branch             = lookup(var.vcs_repo, "branch", null)
      ingress_submodules = lookup(var.vcs_repo, "ingress_submodules", null)
      oauth_token_id     = lookup(var.vcs_repo, "oauth_token_id", null)
    }
  }
}

resource "tfe_variable" "var" {
  for_each = (var.workspace_vars == null) ? {} : var.workspace_vars

  category     = each.value.category
  key          = each.key
  value        = each.value.value
  sensitive    = each.value.sensitive
  workspace_id = tfe_workspace.workspace.id
}
