#
# Cookbook Name:: np-workstation
# Recipe:: default
#
# Copyright (c) 2016-2020 Nick Pegg, All Rights Reserved.

if node['platform'] == 'ubuntu'
  include_recipe 'apt'

  include_recipe 'np-workstation::grub'
  include_recipe 'np-workstation::keyboard_ubuntu'
elsif node['platform'] == 'arch'
  include_recipe 'np-workstation::keyboard_arch'
end

include_recipe 'np-workstation::yubikey'
include_recipe 'np-workstation::xorg'

base_packages = %w(
  firefox
  imagemagick
  jq
  pass
  scrot
  vim
  zsh
)

if node['platform'] == 'ubuntu'
  base_packages << 'chromium-browser'
else
  base_packages << 'chromium'
end

base_packages.each do |pkg|
  package pkg
end

include_recipe 'np-workstation::virtualbox'
package 'vagrant'

if node['platform'] == 'ubuntu'
  docker_installation 'default'
else
  package 'docker'
  package 'docker-compose'
end

if node['platform'] == 'arch'
  package 'pacman-contrib'

  service 'paccache.timer' do
    action :enable
  end
end

