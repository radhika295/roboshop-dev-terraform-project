resource "aws_instance" "bastion" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.bastion_sg_id]
    iam_instance_profile = aws_iam_instance_profile.bastion.name
    subnet_id = local.public_subnet_ids
    root_block_device {
      volume_size           = 60  # Size in GiB
      volume_type           = "gp3" # or "gp2", "io1", etc.
      delete_on_termination = true # Whether to delete the volume when the instance is terminated
    
    }
    user_data = file("bastion.sh")
    tags = merge (
        local.common_tags,
        {
            Name = "${var.project_name}-${var.environment}-bastion"
        }
    )
}



resource "aws_iam_instance_profile" "bastion" {

  name = "bastion"
  role = "BastionTerraformAdmin"
}

