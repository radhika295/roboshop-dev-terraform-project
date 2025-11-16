# module "components" {
#     source = "../../terraform-roboshop-component"
#     component = var.component
#     rule_priority = var.rule_priority
#  }

 module "components" {
    for_each = var.component
    source = "git::https://github.com/radhika295/terraform-roboshop-component.git"
    component = each.key
    rule_priority = each.value.rule_priority
 }