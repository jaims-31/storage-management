variable "sql_admin_password" {
  description = "Mot de passe administrateur du serveur SQL (fourni via terraform.tfvars, jamais commité)"
  type        = string
  sensitive   = true
}
