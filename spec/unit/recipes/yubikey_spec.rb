#
# Cookbook Name:: np-workstation
# Spec:: default
#
# Copyright (c) 2015 Nick Pegg, All Rights Reserved.

require 'spec_helper'

describe 'np-workstation::yubikey' do
  before do
    common_stubs
  end

  subject { memoized_runner(described_recipe) }
  it { is_expected.to create_cookbook_file('/etc/udev/rules.d/70-u2f.rules') }
end
