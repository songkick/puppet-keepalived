# == Define: keepalived::vrrp:sync_group
#
# Create a VRRP synchronization group of VRRP instances that fail over
# together.
#
# === Parameters
#
# $instances:: Array of VRRP instances that fail over together. You must
#              define these separately as keepalived::vrrp::instances
#
# $notify_master:: full path of a script to run when keepalived transitions 
#                  to MASTER state.
#                  Default: undef (don't run any script)
#
# $notify_master:: full path of a script to run when keepalived transitions 
#                  to MASTER state.
#                  Default: undef (don't run any script)
#
# $ensure::    Default: present
#
define keepalived::vrrp::sync_group (
  $instances,
  $notify_master = undef,
  $notify_backup = undef,
  $ensure        = present
) {

  concat::fragment { "keepalived.conf_vrrp_sync_group_${name}":
    ensure  => $ensure,
    target  => "${keepalived::config_dir}/keepalived.conf",
    content => template('keepalived/vrrp_sync_group.erb'),
    order   => 100,
  }

}
