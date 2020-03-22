#
# Cookbook Name:: np-workstation
# Spec:: default
#
# Copyright (c) 2015 Nick Pegg, All Rights Reserved.

require 'spec_helper'

describe 'np-workstation::default' do
  let(:version) { '1.7.2' }
  let(:checksum) { '0383cda303e910829f24a2acc13fcdcbca735c99cb44299183c93eb9d40f18f4' }
  let(:url) { "https://atom-installer.github.com/v#{version}/atom-amd64.deb" }
  let(:cache_path) { ::File.join(Chef::Config[:file_cache_path], 'atom.deb') }

  subject { memoized_runner(described_recipe, '', platform: 'ubuntu', version: '18.04') }

  it do
    is_expected.to create_remote_file(cache_path).with(
      source: [url],
      checksum: checksum
    )
  end
end
