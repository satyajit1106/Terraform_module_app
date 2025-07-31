#dev infrastructure module

module "dev-infra"{
    source = "./infra-app" 
    env = "dev"
    bucket_name = "infra-app-bucket"
    instance_count = 1
    ami_id = "ami-"
    instance_type = "t2.micro"
    hash_key = "studentID" 
} 

module "prod-infra"{
    source = "./infra-app"
    env = "prod"
    bucket_name = "infra-app-bucket"
    instance_count = 2
    ami_id = "ami-"
    instance_type = "t2.medium"
    hash_key = "studentID" 
}

module "stagging-infra"{
    source = "./infra-app"
    env = "stagging"
    bucket_name = "infra-app-bucket"
    instance_count = 1
    ami_id = "ami-"
    instance_type = "t2.small"
    hash_key = "studentID" 
}