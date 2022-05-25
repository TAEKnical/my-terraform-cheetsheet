#terraform show 하면 실제 반영된 값 확인 가능

data "aws_caller_identity" "self" {}

output output_account_id {
    value = data.aws_caller_identity.self.account_id
}