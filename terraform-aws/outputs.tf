output "endpoints" {
  value = <<EOF

Vault Demo IP - Primary (public):  ${aws_instance.vault-demo-primary.public_ip}
Vault Demo IP - Primary (private): ${aws_instance.vault-demo-primary.private_ip}

Vault Demo IP - Secondary (public):  ${aws_instance.vault-demo-secondary.public_ip}
Vault Demo IP - Secondary (private): ${aws_instance.vault-demo-secondary.private_ip}
EOF
}

/*
output "endpoints" {
  value = <<EOF

Vault Demo IP (public):  ${aws_instance.vault-demo.public_ip}
Vault Demo IP (private): ${aws_instance.vault-demo.private_ip}

RDS Instance Endpoint:   ${aws_db_instance.default.endpoint}
RDS Master Username:     ${aws_db_instance.default.username}
RDS Master Password:     ${aws_db_instance.default.password}
EOF
}
*/

