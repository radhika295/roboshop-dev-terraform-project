# create Ec2 Instance

resource "aws_instance" "catalogue" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.catalogue_sg_id]
    subnet_id = local.private_subnet_id
    tags = merge (
        local.common_tags,
        {
            Name = "${var.project_name}-${var.environment}-catalogue"
        }
    )
}