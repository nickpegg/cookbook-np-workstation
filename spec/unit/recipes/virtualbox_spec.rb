#
# Cookbook Name:: np-workstation
# Spec::virtualbox
#
# Copyright (c) 2016 Nick Pegg, All Rights Reserved.

require 'spec_helper'

describe 'np-workstation::virtualbox' do
  let(:version) { '5.1' }
  let(:key) { 'oracle_vbox.asc' }

  shared_examples 'virtualbox' do
    it do
      is_expected.to add_apt_repository('oracle-virtualbox').with(
        key: "http://download.virtualbox.org/virtualbox/debian/#{key}"
      )
    end
    it { is_expected.to install_package "virtualbox-#{version}" }
    it { is_expected.to install_package 'dkms' }
  end

  subject do
    memoized_runner(described_recipe, '', platform: 'ubuntu', version: '14.04') do |node|
      node.default['lsb']['codename'] = 'trusty'
    end
  end

  it_behaves_like 'virtualbox'

  describe 'modern distros' do
    let(:key) { 'oracle_vbox_2016.asc' }

    context 'Debian 8.0' do
      subject do
        memoized_runner(described_recipe, 'Debian 8.5', platform: 'debian', version: '8.0') do |node|
          node.default['lsb']['codename'] = 'jessie'
        end
      end

      it_behaves_like 'virtualbox'
    end

    context 'Ubuntu 16.04' do
      subject do
        memoized_runner(described_recipe, 'Ubuntu 16.04', platform: 'ubuntu', version: '16.04') do |node|
          node.default['lsb']['codename'] = 'xenial'
        end
      end

      it_behaves_like 'virtualbox'
    end
  end
end
