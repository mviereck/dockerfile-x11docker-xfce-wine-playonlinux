# x11docker/xfce-wine-playonlinux

Xfce desktop containing wine, pulseaudio, winetricks, q4wine and playonlinux. Based on debian stretch.

 - [Use x11docker to run GUI applications and desktop environments in docker images.](https://github.com/mviereck/x11docker)

# Examples:
Run Xfce desktop including wine and playonlinux:
  - `x11docker --desktop x11docker/xfce-wine-playonlinux`

Use host folder to preserve installed Windows applications and desktop settings:
  - `x11docker --desktop --home x11docker/xfce-wine-playonlinux`

Run playonlinux with pulseaudio sound and a shared host folder as container home:
 - `x11docker --home --pulseaudio x11docker/xfce-wine-playonlinux playonlinux`
 
 # Screenshot
 Screenshot showing Xfce desktop with wine and pulseaudio sound in a Xephyr window:
 
 ![screenshot](https://raw.githubusercontent.com/mviereck/x11docker/screenshots/screenshot-xfce-wine-playonlinux.png "xfce-wine-playonlinux desktop running in Xephyr window using x11docker")

