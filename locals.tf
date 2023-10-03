locals {
  platform = "${var.vpc_name}-${var.vm_name}"
  db = "${var.vpc_name}-${var.vm_db_name}"
}
