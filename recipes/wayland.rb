# Set up Wayland and Wayland accessories

if platform?('arch')
  package %w(
    alacritty
    i3status
    kanshi
    network-manager-applet
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    rofi
    sway
    swayidle
    swaylock
    wayland
    xorg-xwayland
  )
end

# TODO: Install AUR packages somehow
# aur_packages = %(
#   greetd
#   greetd-tuigreet
# )

directory '/etc/greetd'

cookbook_file '/etc/greetd/config.toml' do
  source 'etc/greetd/config.toml'
end

# TODO
# service 'greetd' do
#   action [:enable, :start]
# end
