resource "gitlab_project" "example" {
  name                       = "$${NAME}"
  path                       = "$${PATH}"
  description                = "$${NAME}"
  visibility_level           = "public"
  tags                       = {}
  default_branch             = "main"
  request_access_enabled     = false
  issues_enabled             = false
  merge_requests_enabled     = false
  pipelines_enabled          = false
  wiki_enabled               = false
  snippets_enabled           = false
  container_registry_enabled = false
  lfs_enabled                = false
  shared_runners_enabled     = false
  packages_enabled           = false
  pages_access_level         = "disabled"
}
