# Map Caps Lock as Control

directory '/usr/local/share/kbd/keymaps' do
  recursive true
end

execute 'loadkeys' do
  command 'loadkeys /usr/local/share/kbd/keymaps/personal.map'
  action :nothing
end

cookbook_file '/usr/local/share/kbd/keymaps/personal.map' do
  source 'keyboard/personal.map'
  notifies :run, 'execute[loadkeys]'
end

file '/etc/vconsole.conf' do
  content 'KEYMAP=personal'
end
