template '/etc/default/keyboard' do
  owner 'root'
  group 'root'
  mode '0644'

  variables(
    config: node[:np_workstation][:keyboard]
  )
end
