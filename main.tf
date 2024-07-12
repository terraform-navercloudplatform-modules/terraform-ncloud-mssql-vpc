resource "ncloud_mssql" "mssql_server" {
  server_name                  = var.server_name
  zone                         = var.zone
  vpc_no                       = var.vpc_no
  subnet_no                    = var.subnet_no
  service_name                 = var.service_name
  is_ha                        = var.is_ha
  user_name                    = var.user_name
  user_password                = var.user_password
  config_group_no              = var.config_group_no
  image_product_code           = var.image_product_code
  product_code                 = var.product_code
  data_storage_type            = var.data_storage_type
  backup_file_retention_period = var.backup_file_retention_period
  backup_time                  = var.backup_time
  is_automatic_backup          = var.is_automatic_backup
  port                         = var.port
  character_set_name           = var.character_set_name
}