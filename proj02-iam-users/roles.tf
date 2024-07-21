locals {
  roles_with_policies = {
    readonly = [
      "ReadOnlyAccess"
    ]
    admin = [
      "AdministratorAccess"
    ]
    auditor = [
      "SecurityAudit"
    ]
    developer = [
      "AmazonVPCFullAccess",
      "AmazonEC2FullAccess",
      "AmazonRDSFullAccess"
    ]
  }

  role_policies_list = flatten([
    for role, policies in local.roles_with_policies : [
      for policy in policies : {
        role   = role
        policy = policy
      }
    ]
  ])
}

# output "roles_with_policies" {
#   value = local.role_policies_list
# }

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "assume_role_policy" {
  for_each = toset(keys(local.roles_with_policies))
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "AWS"
      # identifiers = ["arn:aws:iam::891377239273:user/allwell"]
      identifiers = [
        for username in keys(aws_iam_user.users) : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${username}"
        if contains(local.users_map[username], each.value)
      ]
    }
  }
}

resource "aws_iam_role" "roles" {
  for_each = toset(keys(local.roles_with_policies))
  name     = each.key

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy[each.value].json
}

data "aws_iam_policy" "managed_policies" {
  for_each = toset(local.role_policies_list[*].policy)
  arn      = "arn:aws:iam::aws:policy/${each.value}"
}

# output "iam_policies" {
#   value = {
#     for policy_name, policy_value in data.aws_iam_policy.managed_policies : policy_name => policy_value
#   }
# }

resource "aws_iam_role_policy_attachment" "role_policy_attachments" {
  count = length(local.role_policies_list)
  role = aws_iam_role.roles[
    local.role_policies_list[count.index].role
  ].name
  policy_arn = data.aws_iam_policy.managed_policies[
    local.role_policies_list[count.index].policy
  ].arn
}
