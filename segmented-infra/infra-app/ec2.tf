# Key Pair (login)

resource "aws_key_pair" "key_pair"{
    key_name = "${var.env}-infra-app-key"
    public_key = file("terra-key-ec2.pub")

    tags = {
        Name = "${var.env}"
        Environment = var.env
    }
}

# VPC & Security Group
resource "aws_default_vpc" "default"{

}

# Security Group
resource "aws_security_group" "infra_app_sg" {
    Name = "${var.env}-infra-app-sg"
    description = "Security group for infra app"
    vpc_id = aws_default_vpc.default.id

# inbound rules
ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
}

ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
}

egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
}

tags = {
    Name = "${var.end}-automate-sg"
}
}

resource "aws_instance" "infra_app_instance"{
    count = var.instance_count

    depends_on = [aws_key_pair.keypair, aws_security_group]

    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.key_pair.key_name
    security_groups = [aws_security_group.infra_app_sg.name]

    root_block_device{
        volume_size = var.env = "prd" ? 20 : 10
        volume_type = "gp3"
    }
    tags = {
        Name = "${var.env}-infra-app-instance-${count.index + 1}"
        Environment = var.env
    }
}