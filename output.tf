output "id" {
  description = "The ID of the MSSQL server."
  value       = ncloud_mssql_server.mssql_server.id
}

output "engine_version" {
  description = "MSSQL Engine version."
  value       = ncloud_mssql_server.mssql_server.engine_version
}

output "region_code" {
  description = "Region code."
  value       = ncloud_mssql_server.mssql_server.region_code
}

output "vpc_no" {
  description = "The ID of the associated Vpc."
  value       = ncloud_mssql_server.mssql_server.vpc_no
}

output "access_control_group_no_list" {
  description = "The ID list of the associated Access Control Group."
  value       = ncloud_mssql_server.mssql_server.access_control_group_no_list
}

output "mssql_server_list" {
  description = <<EOF
The list of the MSSQL server.
- server_instance_no: Server instance number.
- server_name: Server name.
- server_role: Server role code. ex) M(Principal), H(Mirror)
- zone_code: Zone code.
- subnet_no: The ID of the associated Subnet.
- product_code: Product code.
- is_public_subnet: Public subnet status.
- private_domain: Private domain.
- public_domain: Public domain.
- memory_size: Available memory size.
- cpu_count: CPU count.
- data_storage_size: Storage size.
- used_data_storage_size: Size of data storage in use.
- uptime: Running start time.
- create_date: Server create date.
EOF
  value       = ncloud_mssql_server.mssql_server.mssql_server_list
}