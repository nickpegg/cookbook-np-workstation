#
# Cookbook Name:: np-workstation
# Recipe:: default
#
# Copyright (c) 2016 Nick Pegg, All Rights Reserved.

include_recipe 'apt'

package 'i3'
package 'pass'

include_recipe 'chef-dk'
include_recipe 'virtualbox'

include_recipe 'np-workstation::atom'
include_recipe 'np-workstation::keyboard'
