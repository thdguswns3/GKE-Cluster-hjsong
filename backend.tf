# 버킷 사전 생성 필요
terraform {
 backend "gcs" {
   bucket  = "hjsong-tfstate-bucket"
   prefix  = "terraform/state"
 }
}