# x11docker/xfce-wine-playonlinux
# Run wine on Xfce desktop in docker. 
# Use x11docker to run image. 
# Get x11docker script and x11docker-gui from github: 
#   https://github.com/mviereck/x11docker 
#
# Examples: x11docker --wm=none x11docker/xfce-wine-playonlinux
#           x11docker x11docker/xfce-wine-playonlinux playonlinux
#
# Use option --home to create a persistant home folder preserving your wine installations.
# Examples: x11docker --wm=none --home x11docker/xfce-wine-playonlinux
#           x11docker --home x11docker/xfce-wine-playonlinux playonlinux
#
# To have pulseaudio sound, add option --pulseaudio.
# To have hardware accelerated graphics, use option --gpu.


FROM x11docker/xfce:latest
RUN echo "deb http://deb.debian.org/debian stretch contrib" >> /etc/apt/sources.list
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y xfce4-whiskermenu-plugin xfce4-notes-plugin

# install wine
RUN apt-get install -y wine wine32 wine64
RUN apt-get install -y fonts-wine winetricks ttf-mscorefonts-installer winbind
# wine gecko
RUN mkdir -p /usr/share/wine/gecko
RUN cd /usr/share/wine/gecko && wget http://dl.winehq.org/wine/wine-gecko/2.40/wine_gecko-2.40-x86.msi
# wine mono
RUN mkdir -p /usr/share/wine/mono
RUN cd /usr/share/wine/mono && wget https://dl.winehq.org/wine/wine-mono/4.7.0/wine-mono-4.7.0.msi

# install playonlinux
RUN apt-get install -y playonlinux xterm gettext

# install q4wine, another frontend for wine
RUN apt-get install -y q4wine

## some X libs, f.e. allowing videos in Xephyr
RUN apt-get install -y --no-install-recommends x11-utils libxv1

## OpenGL support
RUN apt-get install -y mesa-utils mesa-utils-extra libgl1-mesa-glx libglew2.0 libglu1-mesa libgl1-mesa-dri libdrm2 libgles2-mesa libegl1-mesa

## Pulseaudio support
RUN apt-get install -y --no-install-recommends pulseaudio
# enable one of the following to get sound controls
RUN apt-get install -y --no-install-recommends pasystray
# RUN apt-get install -y --no-install-recommends pavucontrol

# dillo browser: not needed for wine, but useful to download windows applications
RUN apt-get install -y dillo

# PDF viewer evince-gtk
RUN apt-get install -y evince-gtk

# clean up
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# create desktop icons that will be copied to every new user
#
RUN mkdir /etc/skel/Desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=Play on Linux\n\
Exec=playonlinux\n\
Icon=playonlinux\n\
" > /etc/skel/Desktop/PlayOnLinux.desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=Q4wine\n\
Exec=q4wine\n\
Icon=q4wine\n\
" > /etc/skel/Desktop/Q4wine.desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=Internet Explorer\n\
Exec=wine iexplore\n\
Icon=applications-internet\n\
" > /etc/skel/Desktop/WineInternetExplorer.desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=WineConsole\n\
Exec=wineconsole\n\
Icon=utilities-terminal\n\
" > /etc/skel/Desktop/WineConsole.desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=File Explorer\n\
Exec=wine explorer\n\
Icon=folder\n\
" > /etc/skel/Desktop/WineExplorer.desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=Notepad\n\
Exec=wine notepad\n\
Icon=wine-notepad\n\
" > /etc/skel/Desktop/WineNotepad.desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=Wordpad\n\
Exec=wine wordpad\n\
Icon=accessories-text-editor\n\
" > /etc/skel/Desktop/WineWordpad.desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=Configure Wine\n\
Exec=winecfg\n\
Icon=wine-winecfg\n\
" > /etc/skel/Desktop/WineCfg.desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=Wine File Manager\n\
Exec=winefile\n\
Icon=folder-wine\n\
" > /etc/skel/Desktop/WineFile.desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=Mines\n\
Exec=wine winemine\n\
Icon=face-cool\n\
" > /etc/skel/Desktop/WineMine.desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=winetricks\n\
Exec=winetricks --gui\n\
Icon=wine\n\
" > /etc/skel/Desktop/winetricks.desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=RegEdit\n\
Exec=regedit\n\
Icon=preferences-system\n\
" > /etc/skel/Desktop/WineRegEdit.desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=UnInstaller\n\
Exec=wine uninstaller\n\
Icon=wine-uninstaller\n\
" > /etc/skel/Desktop/WineUnInstaller.desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=TaskManager\n\
Exec=wine taskmgr\n\
Icon=utilities-system-monitor\n\
" > /etc/skel/Desktop/WineTaskmgr.desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=Wine Control Panel\n\
Exec=wine control\n\
Icon=preferences-system\n\
" > /etc/skel/Desktop/WineControl.desktop

RUN echo "[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=OleView\n\
Exec=wine oleview\n\
Icon=preferences-system\n\
" > /etc/skel/Desktop/WineOleView.desktop

# Create xfce4 panel config
RUN mkdir -p /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/
RUN echo '<?xml version="1.0" encoding="UTF-8"?>\
<channel name="xfce4-panel" version="1.0">\
  <property name="configver" type="int" value="2"/>\
  <property name="panels" type="array">\
    <value type="int" value="1"/>\
    <property name="panel-1" type="empty">\
      <property name="position" type="string" value="p=6;x=0;y=0"/>\
      <property name="length" type="uint" value="100"/>\
      <property name="position-locked" type="bool" value="true"/>\
      <property name="size" type="uint" value="30"/>\
      <property name="plugin-ids" type="array">\
        <value type="int" value="22"/>\
        <value type="int" value="7"/>\
        <value type="int" value="3"/>\
        <value type="int" value="15"/>\
        <value type="int" value="23"/>\
        <value type="int" value="24"/>\
        <value type="int" value="4"/>\
        <value type="int" value="5"/>\
        <value type="int" value="6"/>\
        <value type="int" value="1"/>\
      </property>\
    </property>\
  </property>\
  <property name="plugins" type="empty">\
    <property name="plugin-3" type="string" value="tasklist"/>\
    <property name="plugin-15" type="string" value="separator">\
      <property name="expand" type="bool" value="true"/>\
      <property name="style" type="uint" value="0"/>\
    </property>\
    <property name="plugin-4" type="string" value="pager"/>\
    <property name="plugin-5" type="string" value="clock"/>\
    <property name="plugin-6" type="string" value="systray">\
      <property name="names-visible" type="array">\
        <value type="string" value="vlc"/>\
      </property>\
    </property>\
    <property name="plugin-7" type="string" value="showdesktop"/>\
    <property name="plugin-22" type="string" value="whiskermenu"/>\
    <property name="plugin-23" type="string" value="xfce4-clipman-plugin"/>\
    <property name="plugin-24" type="string" value="screenshooter"/>\
    <property name="plugin-1" type="string" value="actions"/>\
  </property>\
</channel>\
' > /etc/skel/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml


# create startscript 
RUN echo '#! /bin/bash\n\
[ -n $HOME ] && [ ! -e $HOME/.config ] && {\n\
  cp -R /etc/skel/* $HOME\n\
  cp -R /etc/skel/.* $HOME\n\
}\n\
cd $HOME\n\
startxfce4\n\
' > /usr/local/bin/start 
RUN chmod +x /usr/local/bin/start 

CMD start
