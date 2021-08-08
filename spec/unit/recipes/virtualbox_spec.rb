#
# Cookbook:: np-workstation
# Spec::virtualbox
#
# Copyright:: (c) 2016 Nick Pegg, All Rights Reserved.

require 'spec_helper'

describe 'np-workstation::virtualbox' do
  let(:version) { '5.1' }
  let(:key) { 'oracle_vbox_2016.asc' }

  shared_examples 'virtualbox' do
    it do
      is_expected.to add_apt_repository('oracle-virtualbox').with(
        key: ["http://download.virtualbox.org/virtualbox/debian/#{key}"]
      )
    end
    it { is_expected.to install_package "virtualbox" }
    it { is_expected.to install_package 'dkms' }
  end

  subject do
    memoized_runner(described_recipe, '', platform: 'ubuntu', version: '18.04') do |node|
      node.default['lsb']['codename'] = 'trusty'
    end
  end

  it_behaves_like 'virtualbox'
end
