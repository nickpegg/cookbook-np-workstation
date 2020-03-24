#
# Cookbook Name:: np-workstation
# Recipe:: default
#
# Copyright (c) 2016-2020 Nick Pegg, All Rights Reserved.

include_recipe 'np-workstation::grub'
include_recipe 'np-workstation::keyboard'
include_recipe 'np-workstation::yubikey'

include_recipe 'apt'
package %w(
  chromium-browser
  firefox
  i3
  imagemagick
  jq
  pass
  scrot
  xbacklight
  vagrant
  vim
  zsh
)

include_recipe 'np-workstation::virtualbox'
docker_installation 'default'

include_recipe 'np-workstation::acpi_backlight' if node['platform_version'] == '16.10'
