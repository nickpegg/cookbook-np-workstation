#
# Cookbook Name:: np-scaffold
# Spec:: default
#
# Copyright (c) 2015 Nick Pegg, All Rights Reserved.

require 'spec_helper'

describe 'np-scaffold::default' do
  before do
    common_stubs
    @chef_run = memoized_runner(described_recipe)
  end

  subject { @chef_run }
end
