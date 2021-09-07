# Copyright:: 2015 Nick Pegg
# Cookbook:: np-workstation
# Spec:: default

require 'spec_helper'

describe 'np-workstation::default' do
  subject { memoized_runner(described_recipe, '', platform: 'ubuntu', version: '18.04') }

  %w(
    imagemagick
    jq
    pass
    scrot
    vagrant
    vim
    zsh
  ).each do |pkg_name|
    it { is_expected.to install_package pkg_name }
  end

  # TODO: split this into checking for ubuntu vs arch keyboard recipe
  # it { is_expected.to include_recipe 'np-workstation::keyboard' }
  it { is_expected.to include_recipe 'np-workstation::virtualbox' }
  it { is_expected.to include_recipe 'np-workstation::yubikey' }
end
