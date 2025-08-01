variable "env"{
    description = "Environment name for the development"
    type = string
}

variable "region"{
    description = "AWS region to default to for all resources"
    type = string
    default = "us-east-2"
}