output "endpoints" {
  value = <<EOF

Vault Demo IP - Primary (public):  ${aws_instance.vault-demo-primary.public_ip}
Vault Demo IP - Primary (private): ${aws_instance.vault-demo-primary.private_ip}

Vault Demo IP - Secondary (public):  ${aws_instance.vault-demo-secondary.public_ip}
Vault Demo IP - Secondary (private): ${aws_instance.vault-demo-secondary.private_ip}

RDS Instance Endpoint:   ${aws_db_instance.vault-demo.endpoint}
RDS Master Username:     ${aws_db_instance.vault-demo.username}
RDS Master Password:     ${aws_db_instance.vault-demo.password}
EOF
}
