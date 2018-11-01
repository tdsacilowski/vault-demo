//--------------------------------------------------------------------
// Primary Vault Cluster

resource "aws_instance" "vault-demo-primary" {
  ami                         = "${data.aws_ami.ubuntu.id}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${module.vault_demo_vpc.public_subnets[0]}"
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.testing.id}"]
  associate_public_ip_address = true
  iam_instance_profile        = "${aws_iam_instance_profile.vault.id}"

  tags {
    Name     = "${var.environment_name}-vault-server-primary"
    ConsulDC = "demo-primary"
    owner    = "${var.hashibot_reaper_owner}"
    TTL      = "${var.hashibot_reaper_ttl}"
  }

  user_data = "${data.template_file.vault-demo-primary.rendered}"

  lifecycle {
    ignore_changes = ["ami", "tags"]
  }
}

data "template_file" "vault-demo-primary" {
  template = "${file("${path.module}/templates/userdata-vault.tpl")}"

  vars = {
    tpl_vault_zip_file     = "${var.vault_zip_file}"
    tpl_consul_zip_file    = "${var.consul_zip_file}"
    tpl_consul_dc          = "demo-primary"
    tpl_vault_service_name = "vault-demo-primary"
  }
}
