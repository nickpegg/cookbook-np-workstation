# Set up Xorg and Xorg accessories

if platform?('ubuntu')
  packages = %w(
    xorg
    xbacklight
    i3
  )
elsif platform?('arch')
  packages = %w(
    xorg-server
    xorg-xauth
    xorg-xbacklight
    xorg-xsetroot
    xorg-xkill
    xorg-xinit
    xorg-xrandr
    xf86-video-fbdev
    xf86-video-vesa
    xf86-video-intel
    mesa
    vulkan-intel
    i3-wm
  )
end

packages += %w(
  i3status
  lightdm
)

package packages

directory '/etc/X11/xorg.conf.d'

cookbook_file '/etc/X11/xorg.conf.d/20-intel.conf' do
  source 'xorg/20-intel.conf'
end

service 'lightdm' do
  action :enable
end
