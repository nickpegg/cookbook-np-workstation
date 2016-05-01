require 'spec_helper'

describe 'np-workstation::grub' do
  before do
    common_stubs
  end

  subject { memoized_runner(described_recipe) }

  it { is_expected.to create_cookbook_file '/etc/default/grub' }
end
