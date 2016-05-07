require 'spec_helper'

describe 'np-workstation::default' do
  %w(
    atom
    chefdk
    docker-engine
    i3
    jq
    google-chrome-stable
    pass
    vagrant
    vim
    virtualbox-5.0
  ).each do |pkg|
    describe package pkg do
      it { is_expected.to be_installed }
    end
  end

  describe file '/etc/default/keyboard' do
    it { is_expected.to contain 'XKBOPTIONS="ctrl:nocaps,terminate:ctrl_alt_bksp"' }
  end
end
