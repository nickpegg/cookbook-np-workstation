%w(
  firefox
  imagemagick
  jq
  pass
  scrot
  vagrant
  vim
  virtualbox
  zsh
).each do |pkg|
  describe package pkg do
    it { is_expected.to be_installed }
  end
end

if os.name == 'ubuntu'
  %w(
    docker-ce
    i3
    xorg
  ).each do |pkg|
    describe package pkg do
      it { should be_installed }
    end
  end
elsif os.name == 'arch'
  %w(
    docker
    i3-wm
    xorg-server
    xf86-video-intel
    mesa
    vulkan-intel
  ).each do |pkg|
    describe package pkg do
      it { should be_installed }
    end
  end
end

# Github CLI
describe file '/usr/bin/gh' do
  it { should exist }
  it { should be_executable }
end

if os.name == 'ubuntu'
  describe file '/etc/default/keyboard' do
    its('content') { is_expected.to match 'XKBOPTIONS="ctrl:nocaps,terminate:ctrl_alt_bksp"' }
  end
elsif os.name == 'arch'
end

describe file '/etc/X11/xorg.conf.d/20-intel.conf' do
  its('content') { is_expected.to match /Option\s+"DRI" "3"/ }
end

if os.name == 'arch'
  describe service 'paccache.timer' do
    it { should be_enabled }
  end
end

describe file '/etc/systemd/logind.conf' do
  it { should exist }
  its('content') { should match /^HandleLidSwitchExternalPower=ignore/ }
  its('content') { should match /^HandleLidSwitchDocked=ignore/ }
end
