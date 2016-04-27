cookbook_file '/etc/udev/rules.d/70-u2f.rules' do
  owner 'root'
  group 'root'
  mode '0644'
end
