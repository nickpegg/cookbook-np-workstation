require 'spec_helper'

describe 'np-workstation::acpi-backlight' do
  subject { memoized_runner(described_recipe) }

  it { is_expected.to create_file('/etc/acpi/intel-backlight.sh').with_mode('0755') }
  it { is_expected.to create_file '/etc/acpi/events/screen-brightness-up' }
  it { is_expected.to create_file '/etc/acpi/events/screen-brightness-down' }
end
