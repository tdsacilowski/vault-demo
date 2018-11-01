# AWS region in which to deploy
variable aws_region {}

# All resources will be tagged with this
variable environment_name {}

# URL for Vault binary
variable vault_zip_file {
    default = "https://releases.hashicorp.com/vault/0.11.4/vault_0.11.4_linux_amd64.zip"
}

# URL for Consul binary
variable consul_zip_file {
    default = "https://releases.hashicorp.com/consul/1.3.0/consul_1.3.0_linux_amd64.zip"
}

# Instance size
variable instance_type {}

# SSH key name to access EC2 instances (should already exist)
variable key_name {}

# Instance tags for HashiBot AWS resource reaper
variable hashibot_reaper_owner {}
variable hashibot_reaper_ttl {
    default = 48
}
