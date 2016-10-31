# xbacklight stopped working on 16.10, use ACPI events instead
file '/etc/acpi/intel-backlight.sh' do
  mode '0755'
end

%w(up down).each do |dir|
  file "/etc/acpi/events/screen-brightness-#{dir}" do
    notifies :restart, 'service[acpid]'
  end
end

service 'acpid'
