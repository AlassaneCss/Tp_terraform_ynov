provider "github" {
  token = "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"
}

resource "github_repository" "mon_repo" {
  name        = "test cisse"
  description = "Créé avec Terraform"
  private     = true
}

