#
# Cookbook Name:: np-workstation
# Recipe:: virtualbox
#
# Copyright (c) 2016-2020 Nick Pegg, All Rights Reserved.

include_recipe 'apt'

# Oracle switched to using a different key file for Debian >= 8 and Ubuntu >= 16.04
release_major_version = node['platform_version'].split('.').first.to_i
key_file = 'oracle_vbox.asc'

case node['platform']
when 'debian'
  key_file = 'oracle_vbox_2016.asc' if release_major_version >= 8
when 'ubuntu'
  key_file = 'oracle_vbox_2016.asc' if release_major_version >= 16
end

apt_repository 'oracle-virtualbox' do
  uri 'http://download.virtualbox.org/virtualbox/debian'
  key "http://download.virtualbox.org/virtualbox/debian/#{key_file}"
  distribution node['lsb']['codename']
  components ['contrib']
end

package "virtualbox"
package 'dkms'
