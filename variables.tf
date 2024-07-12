variable "subnet_no" {
  description = "(Required) The ID of the associated Subnet."
  type        = string
}

variable "service_name" {
  description = "(Required) Service name to create. Only English alphabets, numbers, dash ( - ) and Korean letters can be entered. Min: 3, Max: 15"
  type        = string
  validation {
    condition     = length(var.service_name) >= 3 && length(var.service_name) <= 15
    error_message = "The length of service_name must be between 3 and 15."
  }
  validation {
    condition     = can(regex("^[a-zA-Z0-9-가-힣]*$", var.service_name))
    error_message = "The service_name must only contain alphanumeric characters, numbers, hyphens (-), and Korean characters."
  }
}

variable "is_ha" {
  description = "(Required) Whether is High Availability or not. If High Availability is selected, 2 servers including the Standby Master server will be created and additional charges will be incurred. Default : true."
  type        = bool
  default     = true
}

variable "user_name" {
  description = "(Required) MSSQL access User ID. Only English letters, numbers, and underscore characters ( _ ) are allowed, and must start with an English letter. Min: 4, Max: 16"
  type        = string
  validation {
    condition     = length(var.user_name) >= 4 && length(var.user_name) <= 16
    error_message = "The length of user_name must be between 4 and 16."
  }
  validation {
    condition     = can(regex("^[a-zA-Z0-9_]*$", var.user_name))
    error_message = "The user_name must only contain English letters, numbers, and underscores (_)."
  }
}

variable "user_password" {
  description = "(Required) MSSQL access User Password. Must be at least 8 characters in length and contain at least 1 each of English letter, special character, and number. Min: 8, Max: 20"
  type        = string
  validation {
    condition     = length(var.user_password) >= 8 && length(var.user_password) <= 20
    error_message = "The length of user_password must be between 8 and 20."
  }
  validation {
    condition     = can(regex("^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[^A-Za-z0-9]).*$", var.user_password))
    error_message = "The user_password must have at least 1 English letter, 1 number, and 1 special character."
  }
}

variable "config_group_no" {
  description = "(Optional) MSSQL config group Number. Already-created Config Group can be applied when creating a server. When you do not have any config groups, you can select from provided config groups by default. You can view through getCloudMssqlConfigGroupList API. Default: 0"
  type        = string
  default     = "0"
}

variable "image_product_code" {
  description = "(Optional) Image product code to determine the MSSQL instance server image specification to create. If not entered, the instance is created for default value. It can be obtained through ncloud_mssql_image_products data source"
  type        = string
  default     = null
}

variable "product_code" {
  description = "(Optional) Product code to determine the MSSQL instance server image specification to create. It can be obtained through ncloud_mssql_products data source. Default : Minimum specifications(1 memory, 2 cpu)"
  type        = string
  default     = null
}

variable "data_storage_type" {
  description = "(Optional) Data storage type. You can select SSD|HDD. Default: SSD"
  type        = string
  default     = "SSD"
  validation {
    condition     = can(regex("^(SSD|HDD)$", var.data_storage_type))
    error_message = "The data_storage_type must be either SSD or HDD."
  }
}

variable "backup_file_retention_period" {
  description = "(Optional) Backups are performed daily and backup files are stored in separate backup storage. Fees are charged based on the space used. Default : 1(1 day), Min: 1, Max: 30"
  type        = number
  default     = 1
  validation {
    condition     = var.backup_file_retention_period >= 1 && var.backup_file_retention_period <= 30
    error_message = "The backup_file_retention_period must be between 1 and 30."
  }
}

variable "backup_time" {
  description = "(Optional, Required if is_backup is true and is_automatic_backup is false) You can set the time when backup is performed. it must be entered if backup status(is_backup) is true and automatic backup status(is_automatic_backup) is false."
  type        = string
  default     = null
}

variable "is_automatic_backup" {
  description = "(Optional) You can select whether to automatically set the backup time. if is_automatic_backup is true, backup_time cannot be entered. Default : true"
  type        = bool
  default     = true
}

variable "port" {
  description = "(Optional) You can set TCP port to access the mssql instance. Default : 1433, Min: 10000, Max: 20000"
  type        = number
  default     = 1433
  validation {
    condition     = var.port >= 10000 && var.port <= 20000
    error_message = "The port must be between 10000 and 20000."
  }
}

variable "character_set_name" {
  description = "(Optional) DB character set can be selected from Korean and English collation. You can view through getCloudMssqlCharacterSetList API. Default: Korean_Wansung_CI_AS. Options: Korean_Wansung_CI_AS, SQL_Latin1_General_CP1_CI_AS"
  type        = string
  default     = "Korean_Wansung_CI_AS"
  validation {
    condition     = can(regex("^(Korean_Wansung_CI_AS|SQL_Latin1_General_CP1_CI_AS)$", var.character_set_name))
    error_message = "The character_set_name must be either Korean_Wansung_CI_AS or SQL_Latin1_General_CP1_CI_AS."
  }
}