module "vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 8.0"
  project_id   = var.project_id
  network_name = "${var.network}-${var.env_name}"
  routing_mode = "GLOBAL"
  subnets = [
    {
      subnet_name           = "subnet-01"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = var.region
      subnet_private_access = "true"
      subnet_flow_logs      = true
      description           = "For private subnet"
    }
  ]

  secondary_ranges = {
    subnet-01 = [
      {
        range_name    = var.ip_range_pods_name
        ip_cidr_range = "10.20.0.0/16"
      },
      {
        range_name    = var.ip_range_services_name
        ip_cidr_range = "10.21.0.0/16"
      }
    ]
  }
}