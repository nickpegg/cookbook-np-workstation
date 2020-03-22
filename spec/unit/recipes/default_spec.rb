#
# Cookbook Name:: np-workstation
# Spec:: default
#
# Copyright (c) 2015 Nick Pegg, All Rights Reserved.

require 'spec_helper'

describe 'np-workstation::default' do
  subject { memoized_runner(described_recipe, '', platform: 'ubuntu', version: '18.04') }

  it { is_expected.to install_package 'i3' }
  it { is_expected.to install_package 'imagemagick' }
  it { is_expected.to install_package 'jq' }
  it { is_expected.to install_package 'pass' }
  it { is_expected.to install_package 'scrot' }
  it { is_expected.to install_package 'uswsusp' }
  it { is_expected.to install_package 'xbacklight' }
  it { is_expected.to install_package 'vagrant' }
  it { is_expected.to install_package 'vim' }
  it { is_expected.to install_package 'zsh' }

  it { is_expected.to include_recipe 'chrome' }

  it { is_expected.to include_recipe 'np-workstation::keyboard' }
  it { is_expected.to include_recipe 'np-workstation::packages' }
  it { is_expected.to include_recipe 'np-workstation::virtualbox' }
  it { is_expected.to include_recipe 'np-workstation::yubikey' }
end
