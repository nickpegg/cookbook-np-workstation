# whole gob of packages that should be installed

include_recipe 'apt'

%w(
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
