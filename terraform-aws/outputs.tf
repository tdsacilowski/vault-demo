output "endpoints" {
  value = <<EOF

Vault Demo IP - Primary (public):  ${aws_instance.vault-demo-primary.public_ip}
Vault Demo IP - Primary (private): ${aws_instance.vault-demo-primary.private_ip}

For example:
   ssh -i ${var.key_name}.pem ubuntu@${aws_instance.vault-demo-primary.public_ip}
EOF
}
