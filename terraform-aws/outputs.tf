output "ip-addresses" {
  value = <<EOF


Vault Demo (public): ${aws_instance.vault-demo.public_ip}
Vault Demo (private): ${aws_instance.vault-demo.private_ip}
EOF
}
