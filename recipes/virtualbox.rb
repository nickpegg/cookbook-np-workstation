# Copyright:: 2016-2020 Nick Pegg
# Cookbook:: np-workstation
# Recipe:: virtualbox

if platform?('ubuntu')
  apt_update

  # Oracle switched to using a different key file for Debian >= 8 and Ubuntu >= 16.04
  key_file = if platform?('ubuntu')
               'oracle_vbox_2016.asc'
             else
               'oracle_vbox.asc'
             end

  apt_repository 'oracle-virtualbox' do
    uri 'http://download.virtualbox.org/virtualbox/debian'
    key "http://download.virtualbox.org/virtualbox/debian/#{key_file}"
    components ['contrib']
  end
end

package 'dkms'
package 'virtualbox'
