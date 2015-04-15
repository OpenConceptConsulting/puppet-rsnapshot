# == Class: rsnapshot
#
# Manages rsnapshot.
#
# === Parameters
#
class rsnapshot (
  $package_name           = $rsnapshot::params::package_name,
  $package_ensure         = $rsnapshot::params::package_ensure,
  $config                 = $rsnapshot::params::config,
  $logfile                = $rsnapshot::params::logfile,
  $lockfile               = $rsnapshot::params::lockfile,
  $config_version         = $rsnapshot::params::config_version,
  $snapshot_root          = $rsnapshot::params::snapshot_root,
  $cmd_cp                 = $rsnapshot::params::cmd_cp,
  $cmd_rm                 = $rsnapshot::params::cmd_rm,
  $cmd_rsync              = $rsnapshot::params::cmd_rsync,
  $cmd_ssh                = $rsnapshot::params::cmd_ssh,
  $cmd_logger             = $rsnapshot::params::cmd_logger,
  $cmd_du                 = $rsnapshot::params::cmd_du,
  $cmd_rsnapshot_diff     = $rsnapshot::params::cmd_rsnapshot_diff,
  $cmd_preexec            = undef,
  $cmd_postexec           = undef,
  $use_lvm                = false,
  $linux_lvm_cmd_lvcreate = $rsnapshot::params::linux_lvm_cmd_lvcreate,
  $linux_lvm_cmd_lvremove = $rsnapshot::params::linux_lvm_cmd_lvremove,
  $linux_lvm_cmd_mount    = $rsnapshot::params::linux_lvm_cmd_mount,
  $linux_lvm_cmd_umount   = $rsnapshot::params::linux_lvm_cmd_umount,
  $linux_lvm_snapshotsize = $rsnapshot::params::linux_lvm_snapshotsize,
  $linux_lvm_snapshotname = $rsnapshot::params::linux_lvm_snapshotname,
  $linux_lvm_vgpath       = $rsnapshot::params::linux_lvm_vgpath,
  $linux_lvm_mountpath    = $rsnapshot::params::linux_lvm_mountpath,
  $snapshot_root          = $rsnapshot::params::snapshot_root,
  $no_create_root         = $rsnapshot::params::no_create_root,
  $verbose_level          = $rsnapshot::params::verbose_level,
  $log_level              = $rsnapshot::params::log_level,
  $stop_on_stale_lockfile = $rsnapshot::params::stop_on_stale_lockfile,
  $rsync_short_args       = $rsnapshot::params::rsync_short_args,
  $rsync_long_args        = $rsnapshot::params::rsync_long_args,
  $ssh_args               = $rsnapshot::params::ssh_args,
  $du_args                = $rsnapshot::params::du_args,
  $one_fs                 = $rsnapshot::params::one_fs,
  $retain                 = $rsnapshot::params::retain,
  $include                = $rsnapshot::params::include,
  $exclude                = $rsnapshot::params::exclude,
  $include_file           = $rsnapshot::params::include_file,
  $exclude_file           = $rsnapshot::params::exclude_file,
  $link_dest              = $rsnapshot::params::link_dest,
  $sync_first             = $rsnapshot::params::sync_first,
  $rsync_numtries         = $rsnapshot::params::rsync_numtries,
  $use_lazy_deletes       = $rsnapshot::params::use_lazy_deletes,
  $backups                = $rsnapshot::params::backups,
  $backup_scripts         = $rsnapshot::params::backup_scripts,
) inherits rsnapshot::params {

  anchor { 'rsnapshot::begin': } ->
  class { 'rsnapshot::install': } ->
  class { 'rsnapshot::config': } ->
  anchor { 'rsnapshot::end': }

}

