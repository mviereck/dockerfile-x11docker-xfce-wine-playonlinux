# x11docker/xfce-wine-playonlinux

XFCE desktop containing wine, pulseaudio, winetricks, q4wine and playonlinux. Based on debian stretch.

 - Use x11docker to run image.
 - Get x11docker and x11docker-gui from github: 
https://github.com/mviereck/x11docker 

# Examples:
 - Run XFCE desktop including wine and playonlinux:
  - `x11docker --desktop x11docker/xfce-wine-playonlinux`

 - Use host folder to preserve installed Windows applications:
  - `x11docker --desktop --home x11docker/xfce-wine-playonlinux`

- Run playolinux with pulseaudio sound and a shared host folder os home:
 - `x11docker --hostuser --home --pulseaudio x11docker/xfce-wine-playonlinux playonlinux`
 
 # Screenshot
 Screenshot showing xfce desktop with wine and pulseaudio sound in a Xephyr window, using [x11docker](https://github.com/mviereck/x11docker), with shared home folder to preserve wine installations and desktop settings.
 
 ![screenshot](https://raw.githubusercontent.com/mviereck/x11docker/screenshots/screenshot-xfce-wine-playonlinux.png "xfce-wine-playonlinux desktop running in Xephyr window using x11docker")

