resource "aws_db_instance" "default" {
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
