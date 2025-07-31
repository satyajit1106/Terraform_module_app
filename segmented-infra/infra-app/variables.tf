variable "env" {
    description = "this is the environment"
    type = string
}

variable "bucket_name"{
    description = "this is the bucket name of the infra"
    type = string
}

variable "instance_count"{
    description = "Number of EC2 instances to create"
    type = number
}

variable "instance_type"{
    description = "Type of the EC2 instance"
    type = string
}

variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type = string
}

variable "hash_key"{
    description = "Hask key for the Dynamodb table"
    type = string
}