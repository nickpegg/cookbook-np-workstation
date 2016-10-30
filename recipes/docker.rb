#
# Cookbook Name:: np-workstation
# Recipe:: docker
#
# Copyright (c) 2016 Nick Pegg, All Rights Reserved.

# Use Ubuntu 16.04 docker repo until they add 16.10 packages
if node['platform'] == 'ubuntu' && node['platform_version'] == '16.10'
  include_recipe 'apt'
  apt_repository 'docker' do
    uri 'https://apt.dockerproject.org/repo'
    key 'http://apt.dockerproject.org/gpg'
    distribution 'ubuntu-xenial'
    components %w(main)
  end

  package 'docker-engine'
else
  docker_installation 'default'
end

docker_service_manager 'default'
