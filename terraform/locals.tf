locals {
  namespaced_service_name = "${var.service_name}"

  lambdas_path = "${path.module}/../lambdas"
  layers_path  = "${local.lambdas_path}/layers"

  lambdas = {
    get = {
      description = "Get clients"
      memory      = 256
      timeout     = 10
    }
    delete = {
      description = "Delete given clients"
      memory      = 128
      timeout     = 5
    }
    put = {
      description = "Update given clients"
      memory      = 128
      timeout     = 5
    }
    post = {
      description = "Create new clients"
      memory      = 128
      timeout     = 5
    }
  }
}
