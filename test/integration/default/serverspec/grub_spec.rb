require 'spec_helper'

describe 'np-workstation::grub' do
  describe file '/etc/default/grub' do
    it { is_expected.to contain 'GRUB_HIDDEN_TIMEOUT_QUIET=false' }
    it { is_expected.to contain 'GRUB_CMDLINE_LINUX_DEFAULT=""' }
  end

  if os[:family] == 'ubuntu'
    describe file '/usr/share/plymouth/themes/ubuntu-logo/ubuntu-logo.grub' do
      it { is_expected.to contain 'background_color 0,0,0,0' }
    end
  end
end
