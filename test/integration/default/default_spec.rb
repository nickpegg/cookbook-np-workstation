%w(
  docker-ce
  i3
  imagemagick
  jq
  google-chrome-stable
  pass
  scrot
  uswsusp
  vagrant
  vim
  virtualbox
  zsh
).each do |pkg|
  describe package pkg do
    it { is_expected.to be_installed }
  end
end

describe file '/etc/default/keyboard' do
  its('content') { is_expected.to match 'XKBOPTIONS="ctrl:nocaps,terminate:ctrl_alt_bksp"' }
end

%w(
  /etc/acpi/intel-backlight.sh
  /etc/acpi/events/screen-brightness-up
  /etc/acpi/events/screen-brightness-down
).each do |acpi_file|
  describe file acpi_file do
    if os[:release] == '16.10'
      it { is_expected.to exist }
    else
      it { is_expected.to_not exist }
    end
  end
end
