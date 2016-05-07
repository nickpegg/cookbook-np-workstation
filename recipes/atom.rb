file_path = ::File.join(Chef::Config[:file_cache_path], 'atom.deb')

package %w(gconf2 gvfs-bin)

remote_file file_path do
  source "https://atom-installer.github.com/v#{node[:np_workstation][:atom][:version]}/atom-amd64.deb"
  checksum node[:np_workstation][:atom][:checksum]

  notifies :run, 'execute[install atom]', :immediately
end

execute 'install atom' do
  command "dpkg -i #{file_path} || apt-get install -f -y -q"
  action :nothing
end
