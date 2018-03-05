# x11docker/xfce-wine-playonlinux

Xfce desktop containing wine, winetricks, q4wine and playonlinux

 - Get [x11docker from github](https://github.com/mviereck/x11docker) to run GUI applications and desktop environments in docker images.
 - Use x11docker to run image. 

# Examples:
Run Xfce desktop including wine:
  - `x11docker --desktop x11docker/xfce-wine-playonlinux`

Use host folder to preserve installed Windows applications with option `--home`: 
  - `x11docker --desktop --home x11docker/xfce-wine-playonlinux`

Run PlayOnLinux only:
  - `x11docker --home x11docker/xfce-wine-playonlinux playonlinux`

# Options:
 - Persistent home folder stored on host with   `--home`
 - Shared host folder with                      `--sharedir DIR`
 - Hardware acceleration with option            `--gpu`
 - Clipboard sharing with option                `--clipboard`
 - Sound support with option                    `--pulseaudio` or `--alsa`
 
See `x11docker --help` for further options.

# Language
The default language locale setting is `en_US.UTF-8`. You can change to your desired locale with x11docker options. Compare the output of `echo $LANG` on your host computer.
 - Example for german: `--env LANG=de_DE.UTF-8`
 - Example for chinese: `--env LANG=zh_CN.UTF-8`
 
# Fonts: chinese, japanese, korean
To enable chinese, japanese and korean fonts in wine, run `winetricks cjkfonts`. You can also use a starter provided on the desktop  for this. 

# Extend image
To add your desired applications, create your own Dockerfile with this image as a base. Example:
```
FROM x11docker/xfce-wine-playonlinux
RUN apt-get update
RUN apt-get install -y vlc
```
 # Screenshot
 Screenshot showing Xfce desktop with wine and pulseaudio sound in a Xephyr window:
 
 ![screenshot](https://raw.githubusercontent.com/mviereck/x11docker/screenshots/screenshot-xfce-wine-playonlinux.png "xfce-wine-playonlinux desktop running in Xephyr window using x11docker")

