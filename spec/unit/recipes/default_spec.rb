#
# Cookbook Name:: np-workstation
# Spec:: default
#
# Copyright (c) 2015 Nick Pegg, All Rights Reserved.

require 'spec_helper'

describe 'np-workstation::default' do
  before do
    common_stubs
  end

  subject { memoized_runner(described_recipe) }

  it { is_expected.to install_package 'pass' }
  it { is_expected.to install_package 'virtualbox' }

  it { is_expected.to include_recipe 'atom' }
  it { is_expected.to include_recipe 'chef-dk' }

  it { is_expected.to include_recipe 'np-workstation::keyboard' }
end
