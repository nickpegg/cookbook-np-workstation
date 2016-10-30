#
# Cookbook Name:: np-workstation
# Spec:: packages
#
# Copyright (c) 2015 Nick Pegg, All Rights Reserved.

require 'spec_helper'

describe 'np-workstation::packages' do
  subject { memoized_runner(described_recipe, '', platform: 'debian', version: '8.0') }

  it { is_expected.to add_apt_repository 'chef' }

  it { is_expected.to install_package 'chefdk' }
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

end
