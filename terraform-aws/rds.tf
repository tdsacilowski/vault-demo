resource "aws_db_instance" "vault-demo" {
  # Set var.db_count to 0 to disable this resource  # Default is 1  #count = "${var.db_count}"

  allocated_storage         = 10
  storage_type              = "gp2"
  engine                    = "postgres"
  engine_version            = "9.6.6"
  instance_class            = "db.t2.micro"
  name                      = "mydb"
  username                  = "foo"
  password                  = "foobarbaz"
  skip_final_snapshot       = "true"
  final_snapshot_identifier = "some-snap"
}
