resource "aws_dynamodb_table" "example" {
  name             = "${var.env}-infra-app-table"
  hash_key         =  var.hash_key
  billing_mode     = "PAY_PER_REQUEST"


  attribute {
    name = "LockID"
    type = "S"
  }

  tags{
    Name = "${var.env}-dynamodb-table"
    Environment = var.env
  }

  replica {
    region_name      = "us-east-2"
    consistency_mode = "STRONG"
  }

  replica {
    region_name      = "us-west-2"
    consistency_mode = "STRONG"
  }
}