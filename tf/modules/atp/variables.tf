// Copyright (c) 2017, 2019, Oracle and/or its affiliates. All rights reserved.

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}

variable "autonomous_database_cpu_core_count" {
  default = 1
}

variable "autonomous_database_data_storage_size_in_tbs" {
  default = 1
}

variable "autonomous_database_db_name" {
  default = "adbdb1"
}

variable "autonomous_data_warehouse_db_name" {
  default = "adbdw1"
}

variable "autonomous_database_db_workload" {
  default = "OLTP"
}

variable "autonomous_data_warehouse_db_workload" {
  default = "DW"
}

variable "autonomous_database_defined_tags_value" {
  default = "value"
}

variable "autonomous_database_display_name" {
  default = "Demo2_InfraAsCode_ATP"
}

variable "autonomous_data_warehouse_display_name" {
  default = "example_autonomous_data_warehouse"
}

variable "autonomous_database_freeform_tags" {
  default = {
    "Mandatory_Tags.Project" = "DBDevOpsDemoPod",
	"Mandatory_Tags.Creator" = "christophe.pruvost"
	"Mandatory_Tags.Schedule" = "24x7"
  }
}

variable "autonomous_database_license_model" {
  default = "BRING_YOUR_OWN_LICENSE"
}