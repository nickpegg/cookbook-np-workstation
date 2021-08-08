# Copyright:: 2015 Nick Pegg
# Cookbook:: np-workstation
# Spec:: default

require 'spec_helper'

describe 'np-workstation::keyboard' do
  subject { memoized_runner(described_recipe) }

  it do
    is_expected.to create_template('/etc/default/keyboard').with(
      owner: 'root',
      group: 'root',
      mode: '0644',
      variables: {
        config: {
          'model' => 'pc105',
          'layout' => 'us',
          'options' => %w(
            ctrl:nocaps
            terminate:ctrl_alt_bksp
          ),
        },
      }
    )
  end
end
