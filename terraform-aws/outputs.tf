# output "endpoints" {
#   value = <<EOF

# Vault Demo IP - Primary (public):  ${aws_instance.vault-demo-primary.public_ip}
# Vault Demo IP - Primary (private): ${aws_instance.vault-demo-primary.private_ip}

# Vault Demo IP - Secondary (public):  ${aws_instance.vault-demo-secondary.public_ip}
# Vault Demo IP - Secondary (private): ${aws_instance.vault-demo-secondary.private_ip}
# EOF
# }

output "endpoints" {
  value = <<EOF


Vault Demo IP - Primary (public):  ${aws_instance.vault-demo-primary.public_ip}
Vault Demo IP - Primary (private): ${aws_instance.vault-demo-primary.private_ip}


Vault Demo IP - Secondary (public):  ${aws_instance.vault-demo-secondary.public_ip}
Vault Demo IP - Secondary (private): ${aws_instance.vault-demo-secondary.private_ip}


RDS Instance Endpoint:   ${module.vault_demodb.this_db_instance_endpoint}
RDS Master Username:     ${module.vault_demodb.this_db_instance_username}
RDS Master Password:     ${module.vault_demodb.this_db_instance_password}
EOF
}
