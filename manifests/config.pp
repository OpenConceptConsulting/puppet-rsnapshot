# == Class: rsnapshot::config
#
# Manages the rsnapshot configuration file
class rsnapshot::config inherits rsnapshot {

  $no_create_root_num         = bool2num($rsnapshot::no_create_root)
  $stop_on_stale_lockfile_num = bool2num($rsnapshot::stop_on_stale_lockfile)
  $one_fs_num                 = bool2num($rsnapshot::one_fs)
  $link_dest_num              = bool2num($rsnapshot::link_dest)
  $sync_first_num             = bool2num($rsnapshot::sync_first)
  $use_lazy_deletes_num       = bool2num($rsnapshot::use_lazy_deletes)

  file { $rsnapshot::config:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('rsnapshot/rsnapshot.erb')
  }

}

