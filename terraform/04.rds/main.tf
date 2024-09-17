resource "aws_rds_cluster" "main" {
  cluster_identifier     = "${var.env}-${var.component}"
  engine                 = "aurora-mysql"
  engine_version         = "5.7.mysql_aurora.2.11.3"
  db_subnet_group_name   = data.aws_ssm_parameter.db_subnet_id.value
  database_name          = "tranctions"
  master_username        = "root"
  master_password        = "ExpenseApp1"
  vpc_security_group_ids = [data.aws_ssm_parameter.database_sg_id.value]
  skip_final_snapshot    = true
#   kms_key_id             = var.kms_key_id
  storage_encrypted      = true
}

resource "aws_rds_cluster_instance" "main" {
  count              = 1
  identifier         = "${var.env}-${var.component}-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.main.id
  instance_class     = "db.t3.medium"
  engine             = aws_rds_cluster.main.engine
  engine_version     = aws_rds_cluster.main.engine_version
}