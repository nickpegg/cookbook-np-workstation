# Copyright:: 2016 Nick Pegg
# Cookbook:: np-workstation
# Recipe:: grub

# Get rid of the Ubuntu boot splash screen

cookbook_file '/etc/default/grub' do
  source 'default-grub'
  mode '0644'
  notifies :run, 'execute[update-grub]'
end

if platform?('ubuntu')
  # package 'plymouth-themes'
  package 'plymouth-label'

  directory '/usr/share/plymouth/themes/ubuntu-logo' do
    recursive true
  end

  cookbook_file '/usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.grub' do
    source 'grub/plymouth'
    mode '0644'
    notifies :run, 'execute[update-grub]'
  end

end

execute 'update-grub' do
  action :nothing
  only_if 'which update-grub'
end
