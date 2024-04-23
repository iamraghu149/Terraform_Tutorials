resource "aws_db_instance" "myrds" {
  engine = "mysql"
  engine_version = "8.0.35"
  allocated_storage = 20
  storage_type = "gp2"
  instance_class = "db.c6gd.medium"
  identifier = "rdstf"
  username = "admin"
  password = "password12345"
  publicly_accessible = "true"
  skip_final_snapshot = "true"

  tags = {
    Name = "MyRDS"
  }
}
