output "endpoints" {
  value = <<EOF

Vault Demo IP (public):  ${aws_instance.vault-demo.public_ip}
Vault Demo IP (private): ${aws_instance.vault-demo.private_ip}

RDS Instance Endpoint:   ${aws_db_instance.default.endpoint}
RDS Master Username:     ${aws_db_instance.default.username}
RDS Master Password:     ${aws_db_instance.default.password}
EOF
}
