template '/etc/default/keyboard' do
  owner 'root'
  group 'root'
  mode '0644'

  variables(
    config: node[:np_workstation][:keyboard]
  )

  notifies :run, 'execute[reconfigure console-setup]'
end

execute 'reconfigure console-setup' do
  command 'dpkg-reconfigure -phigh -fnoninteractive console-setup'
  action :nothing
end
