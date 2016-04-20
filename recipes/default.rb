#
# Cookbook Name:: np-workstation
# Recipe:: default
#
# Copyright (c) 2016 Nick Pegg, All Rights Reserved.

# Assumes that np-base has been applied

package 'virtualbox'
package 'pass'

include_recipe 'np-workstation::keyboard'
