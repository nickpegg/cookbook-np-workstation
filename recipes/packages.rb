# whole gob of packages that should be installed

include_recipe 'apt'

apt_repository 'chef' do
  uri 'https://packages.chef.io/repos/apt/stable'
  key 'https://packages.chef.io/chef.asc'
  components %w(main)

  # TODO: Remove this when yakkety packages are available
  distribution 'xenial' if node['platform_version'] == '16.10'
end

%w(
  chefdk
  i3
  imagemagick
  jq
  pass
  scrot
  uswsusp
  xbacklight
  vagrant
  vim
  zsh
).each do |pkg|
  package pkg
end
