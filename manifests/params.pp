# == Class: rsnapshot
#
# Sets the default parameters for rsnapshot.
class rsnapshot::params {

  $package_ensure = present

  $snapshot_root          = '/backup/'
  $no_create_root         = false
  $verbose_level          = 2
  $log_level              = 3
  $stop_on_stale_lockfile = false
  $rsync_short_args       = undef
  $rsync_long_args        = undef
  $ssh_args               = undef
  $du_args                = undef
  $one_fs                 = false
  $retain                 = {
    'hourly'  => 6,
    'daily'   => 7,
    'weekly'  => 4,
    'monthly' => 3,
  }
  $include                = []
  $exclude                = []
  $include_file           = undef
  $exclude_file           = undef
  $link_dest              = false
  $sync_first             = false
  $rsync_numtries         = 1
  $use_lazy_deletes       = false
  $linux_lvm_snapshotsize = '100M'
  $linux_lvm_snapshotname = 'rsnapshot'
  $linux_lvm_vgpath       = '/dev'
  $linux_lvm_mountpath    = '/mount/rsnapshot'
  $backups                = {}
  $backup_scripts         = {}

  $default_package_name           = 'rsnapshot'
  $default_config                 = '/etc/rsnapshot.conf'
  $default_logfile                = '/var/log/rsnapshot.log'
  $default_lockfile               = '/var/run/rsnapshot.pid'
  $default_cmd_cp                 = '/bin/cp'
  $default_cmd_rm                 = '/bin/rm'
  $default_cmd_rsync              = '/usr/bin/rsync'
  $default_cmd_ssh                = '/usr/bin/ssh'
  $default_cmd_logger             = '/usr/bin/logger'
  $default_cmd_du                 = '/usr/bin/du'
  $default_cmd_rsnapshot_diff     = '/usr/bin/rsnapshot-diff'
  $default_linux_lvm_cmd_lvcreate = '/sbin/lvcreate'
  $default_linux_lvm_cmd_lvremove = '/sbin/lvremove'
  $default_linux_lvm_cmd_mount    = '/sbin/mount'
  $default_linux_lvm_cmd_umount   = '/sbin/umount'

  case $::osfamily {
    'Debian': {
      $package_name  = $default_package_name
      $config        = $default_config
      $logfile       = $default_logfile
      $lockfile      = $default_lockfile

      $config_version         = '1.2'
      $cmd_cp                 = $default_cmd_cp
      $cmd_rm                 = $default_cmd_rm
      $cmd_rsync              = $default_cmd_rsync
      $cmd_ssh                = $default_cmd_ssh
      $cmd_logger             = $default_cmd_logger
      $cmd_du                 = $default_cmd_du
      $cmd_rsnapshot_diff     = $default_cmd_rsnapshot_diff
      $linux_lvm_cmd_lvcreate = $default_linux_lvm_cmd_lvcreate
      $linux_lvm_cmd_lvremove = $default_linux_lvm_cmd_lvremove
      $linux_lvm_cmd_mount    = $default_linux_lvm_cmd_mount
      $linux_lvm_cmd_umount   = $default_linux_lvm_cmd_umount
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}

