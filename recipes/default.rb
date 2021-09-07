#
# Copyright:: 2016-2021 Nick Pegg
# Recipe:: default
# Cookbook:: np-workstation

if platform?('ubuntu')
  apt_update
  include_recipe 'np-workstation::grub'
  include_recipe 'np-workstation::keyboard_ubuntu'
elsif platform?('arch')
  include_recipe 'np-workstation::keyboard_arch'
end

include_recipe 'np-workstation::yubikey'

if node['np-workstation']['graphics'] == 'xorg'
  include_recipe 'np-workstation::xorg'
elsif node['np-workstation']['graphics'] == 'wayland' && platform?('arch')
  include_recipe 'np-workstation::wayland'
end

base_packages = %w(
  firefox
  imagemagick
  jq
  pass
  scrot
  vim
  zsh
)

base_packages << if platform?('ubuntu')
                   'chromium-browser'
                 else
                   'chromium'
                 end

base_packages.each do |pkg|
  package pkg
end

include_recipe 'np-workstation::virtualbox'
package 'vagrant'

if platform?('ubuntu')
  docker_installation 'default'
else
  package 'docker'
  package 'docker-compose'
end

if platform?('arch')
  package 'pacman-contrib'

  service 'paccache.timer' do
    action :enable
  end
end
