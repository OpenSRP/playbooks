module "lb" {
  source                             = "../load-balancer"
  lb_env                             = var.lbvm_env
  lb_owner                           = var.lbvm_owner
  lb_end_date                        = var.lbvm_end_date
  lb_project                         = var.lbvm_project
  lb_name                            = var.lbvm_name
  lb_vpc_id                          = var.lbvm_vpc_id
  lb_subnets                         = var.lbvm_subnet_ids
  lb_instance_port                   = var.lbvm_lb_instance_port
  lb_instance_protocol               = var.lbvm_lb_instance_protocol
  lb_health_check_path               = var.lbvm_lb_health_check_path
  lb_instance_ids                    = module.vm.vm_ids
  lb_listener_rules                  = var.lbvm_lb_listener_rules
  lb_domain_zone_name                = var.lbvm_domain_zone_name
  lb_domain_name                     = var.lbvm_domain_name
  lb_domain_name_cnames              = var.lbvm_domain_name_cnames
  lb_ssl_policy                      = var.lbvm_lb_ssl_policy
  lb_idle_timeout                    = var.lbvm_lb_idle_timeout
  lb_logs_object_storage_bucket_name = var.lbvm_lb_logs_object_storage_bucket_name
  lb_stickiness_cookie_duration      = var.lbvm_lb_stickiness_cookie_duration
  lb_stickiness_enabled              = var.lbvm_lb_stickiness_enabled
  lb_alarm_alarm_actions             = var.lbvm_alarm_alarm_actions
  lb_alarm_insufficient_data_actions = var.lbvm_alarm_insufficient_data_actions
  lb_alarm_ok_actions                = var.lbvm_alarm_ok_actions
}

