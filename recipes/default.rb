#
# Cookbook Name:: np-workstation
# Recipe:: default
#
# Copyright (c) 2016 Nick Pegg, All Rights Reserved.

include_recipe 'apt'

package 'i3'
package 'jq'
package 'pass'
package 'xbacklight'
package 'vagrant'
package 'vim'

include_recipe 'chef-dk'
include_recipe 'chrome'

include_recipe 'np-workstation::atom'
include_recipe 'np-workstation::docker'
include_recipe 'np-workstation::grub'
include_recipe 'np-workstation::keyboard'
include_recipe 'np-workstation::virtualbox'
include_recipe 'np-workstation::yubikey'
