provider "aws" {
    region = "ap-northeast-2"
    version = "~>3.63"
    profile = "jtlee"
}

terraform {
  backend "remote" {
    organization = "<organization>"
    workspaces {
      name = "<workspace>"
    }
  }
}
#~/.terraform.d/credentials.tfrc.json 파일에 아래 내용 입력
# {
#   "credentials": {
#     "app.terraform.io": {
#       "token": "토큰값"
#     }
#   }
# }