if os[:family] == 'ubuntu'
  describe file '/etc/default/grub' do
    its('content') { is_expected.to match 'GRUB_HIDDEN_TIMEOUT_QUIET=false' }
    its('content') { is_expected.to match 'GRUB_CMDLINE_LINUX_DEFAULT=""' }
  end

  describe file '/usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.grub' do
    its('content') { is_expected.to match 'background_color 0,0,0,0' }
  end
end
