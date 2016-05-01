#
# Cookbook Name:: np-workstation
# Recipe:: grub
#
# Copyright (c) 2016 Nick Pegg, All Rights Reserved.

cookbook_file '/etc/default/grub' do
  source 'default-grub'
  mode 0644
  notifies :run, 'execute[update-grub]'
end

execute 'update-grub' do
  action :nothing
end
