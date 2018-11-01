# module "vault_demodb" {
#   source     = "terraform-aws-modules/rds/aws"
#   identifier = "${var.environment_name}-demodb"

#   engine            = "postgres"
#   engine_version    = "9.6.6"
#   instance_class    = "db.t2.micro"
#   allocated_storage = 5

#   name     = "demodb"
#   username = "dbadmin"
#   password = "mypassword"
#   port     = "5432"

#   maintenance_window = "Mon:00:00-Mon:03:00"
#   backup_window      = "03:00-06:00"

#   vpc_security_group_ids = ["${aws_security_group.testing.id}"]

#   # DB subnet group
#   subnet_ids = ["${module.vault_demo_vpc.database_subnets}"]

#   #db_subnet_group_name = "${module.vault_demo_vpc.database_subnet_group}"

#   skip_final_snapshot       = "true"
#   final_snapshot_identifier = "vault-demodb"
#   family                    = "postgres9.6"

#   #create_db_parameter_group = "false"

#   tags = {
#     Name  = "${var.environment_name}-rds-instance"
#     owner = "teddy@hashicorp.com"
#     TTL   = "-1"
#   }
# }
