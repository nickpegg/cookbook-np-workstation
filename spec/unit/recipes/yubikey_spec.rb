# Copyright:: 2015 Nick Pegg
# Cookbook:: np-workstation
# Spec:: default

require 'spec_helper'

describe 'np-workstation::yubikey' do
  subject { memoized_runner(described_recipe) }
  it { is_expected.to create_cookbook_file('/etc/udev/rules.d/70-u2f.rules') }
end
