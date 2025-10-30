locals {
  ami_id = data.aws_ami.joindevops.id
  catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
  private_subnet_id = split("," , data.aws_ssm_parameter.private_subnet_id.value)[0]
  common_tags = {
    Project = var.project_name
    Environment = var.environment
    Terraform = true
  }
}