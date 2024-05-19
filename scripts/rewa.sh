# -1) Local reposetory Installation
mkdir /opt/repo_bkp
mv /etc/yum.repos.d/*.* /opt/repo_bkp 
wget -P /etc/yum.repos.d/ http://172.16.8.62/fedora35/repo_local/fedora_35/fedora35_byjus_local.repo  2>> /mnt/install.log
yum clean all 2>> /mnt/install.log
yum repolist 2>> /mnt/install.log

# 0) Update system
yum -y update 2>> /mnt/update.log

# 1) rpmfusion reposetory Intallation
#yum install -y ftp://172.16.8.62/req_libs/rpmfusion-free-release-35.noarch.rpm 2>> /mnt/install.log

# 2) Install  Desktop Environment
#yum -y group install "Deepin Desktop Environment" 2>> /mnt/install.log

#OR
yum -y group install "Cinnamon Desktop" 2>> /mnt/install.log

#OR

#dnf -y group install 'XFCE Desktop' 2>> /mnt/install.log

# 3) Change run lavel
systemctl set-default graphical.target 2>> /mnt/install.log

# 4) Install google-chrome
#sudo yum install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm 2>> /mnt/install.log
yum install -y ftp://172.16.8.62/req_apps/google-chrome-stable_current_x86_64.rpm  2>> /mnt/install.log

# 5) Enable ssh root login
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config  2>> /mnt/install.log

# 6) Setting hostname...
Serial_Number=$(cat /sys/class/dmi/id/product_serial)
hostnamectl hostname $Serial_Number.tnl.com
echo $Serial_Number.tnl.com > /etc/hostname

# 7) NTP Configuration for Time sync...
sed -i -e '/server [1-3]/d' -e  's/0.centos.pool.ntp.org/172.16.8.62/g' /etc/chrony.conf
systemctl enable chronyd.service >> /opt/install.log
systemctl restart chronyd.service >> /opt/install.log

# 8) Update karnel file....
grub2-mkconfig -o /boot/grub2/grub.cfg

# 9) Filezilla installation
#yum install -y ftp://172.16.8.62/req_apps/filezilla.rpm 2>> /mnt/install.log
#yum -y install http://172.16.8.62/rpm/adwaita-cursor-theme-41.0-1.fc35.noarch.rpm http://172.16.8.62/rpm/adwaita-icon-theme-41.0-1.fc35.noarch.rpm http://172.16.8.62/rpm/alsa-lib-1.2.6.1-3.fc35.x86_64.rpm http://172.16.8.62/rpm/atk-2.36.0-4.fc35.x86_64.rpm http://172.16.8.62/rpm/at-spi2-atk-2.38.0-3.fc35.x86_64.rpm http://172.16.8.62/rpm/at-spi2-core-2.42.0-1.fc35.x86_64.rpm http://172.16.8.62/rpm/cairo-1.17.4-4.fc35.x86_64.rpm http://172.16.8.62/rpm/cairo-gobject-1.17.4-4.fc35.x86_64.rpm http://172.16.8.62/rpm/cdparanoia-libs-10.2-38.fc35.x86_64.rpm http://172.16.8.62/rpm/colord-libs-1.4.5-3.fc35.x86_64.rpm http://172.16.8.62/rpm/dconf-0.40.0-5.fc35.x86_64.rpm http://172.16.8.62/rpm/exempi-2.5.1-7.fc35.x86_64.rpm http://172.16.8.62/rpm/exiv2-0.27.5-1.fc35.x86_64.rpm http://172.16.8.62/rpm/exiv2-libs-0.27.5-1.fc35.x86_64.rpm http://172.16.8.62/rpm/filezilla-3.57.0-1.fc35.x86_64.rpm http://172.16.8.62/rpm/flac-libs-1.3.4-1.fc35.x86_64.rpm http://172.16.8.62/rpm/fontconfig-2.13.94-5.fc35.x86_64.rpm http://172.16.8.62/rpm/fribidi-1.0.10-5.fc35.x86_64.rpm http://172.16.8.62/rpm/gdk-pixbuf2-modules-2.42.6-2.fc35.x86_64.rpm http://172.16.8.62/rpm/giflib-5.2.1-8.fc35.x86_64.rpm http://172.16.8.62/rpm/graphene-1.10.6-3.fc35.x86_64.rpm http://172.16.8.62/rpm/gsm-1.0.19-6.fc35.x86_64.rpm http://172.16.8.62/rpm/gstreamer1-1.20.0-1.fc35.x86_64.rpm http://172.16.8.62/rpm/gstreamer1-plugins-base-1.20.0-1.fc35.x86_64.rpm http://172.16.8.62/rpm/gtk3-3.24.31-2.fc35.x86_64.rpm http://172.16.8.62/rpm/gtk-update-icon-cache-3.24.31-2.fc35.x86_64.rpm http://172.16.8.62/rpm/hicolor-icon-theme-0.17-11.fc35.noarch.rpm http://172.16.8.62/rpm/iso-codes-4.6.0-2.fc35.noarch.rpm http://172.16.8.62/rpm/jbigkit-libs-2.1-22.fc35.x86_64.rpm http://172.16.8.62/rpm/lcms2-2.12-2.fc35.x86_64.rpm http://172.16.8.62/rpm/libasyncns-0.8-21.fc35.x86_64.rpm http://172.16.8.62/rpm/libcanberra-0.30-27.fc35.x86_64.rpm http://172.16.8.62/rpm/libcanberra-gtk3-0.30-27.fc35.x86_64.rpm http://172.16.8.62/rpm/libcloudproviders-0.3.1-4.fc35.x86_64.rpm http://172.16.8.62/rpm/libcue-2.2.1-8.fc35.x86_64.rpm http://172.16.8.62/rpm/libdatrie-0.2.13-2.fc35.x86_64.rpm http://172.16.8.62/rpm/libdecor-0.1.0-1.fc35.x86_64.rpm http://172.16.8.62/rpm/libdrm-2.4.110-1.fc35.x86_64.rpm http://172.16.8.62/rpm/libepoxy-1.5.9-1.fc35.x86_64.rpm http://172.16.8.62/rpm/libexif-0.6.23-1.fc35.x86_64.rpm http://172.16.8.62/rpm/libfilezilla-0.35.0-1.fc35.x86_64.rpm http://172.16.8.62/rpm/libgexiv2-0.14.0-1.fc35.x86_64.rpm http://172.16.8.62/rpm/libglvnd-1.3.4-2.fc35.x86_64.rpm http://172.16.8.62/rpm/libglvnd-egl-1.3.4-2.fc35.x86_64.rpm http://172.16.8.62/rpm/libglvnd-glx-1.3.4-2.fc35.x86_64.rpm http://172.16.8.62/rpm/libgrss-0.7.0-13.fc35.x86_64.rpm http://172.16.8.62/rpm/libgsf-1.14.47-4.fc35.x86_64.rpm http://172.16.8.62/rpm/libgxps-0.3.2-2.fc35.x86_64.rpm http://172.16.8.62/rpm/libICE-1.0.10-7.fc35.x86_64.rpm http://172.16.8.62/rpm/libimobiledevice-1.3.0-4.fc35.x86_64.rpm http://172.16.8.62/rpm/libiptcdata-1.0.5-9.fc35.x86_64.rpm http://172.16.8.62/rpm/libmspack-0.10.1-0.6.alpha.fc35.x86_64.rpm http://172.16.8.62/rpm/libogg-1.3.5-2.fc35.x86_64.rpm http://172.16.8.62/rpm/libosinfo-1.9.0-2.fc35.x86_64.rpm http://172.16.8.62/rpm/libpciaccess-0.16-5.fc35.x86_64.rpm http://172.16.8.62/rpm/libplist-2.2.0-5.fc35.x86_64.rpm http://172.16.8.62/rpm/libSM-1.2.3-9.fc35.x86_64.rpm http://172.16.8.62/rpm/libsndfile-1.0.31-6.fc35.x86_64.rpm http://172.16.8.62/rpm/libthai-0.1.28-7.fc35.x86_64.rpm http://172.16.8.62/rpm/libtheora-1.1.1-30.fc35.x86_64.rpm http://172.16.8.62/rpm/libtiff-4.3.0-4.fc35.x86_64.rpm http://172.16.8.62/rpm/libtracker-sparql-3.2.1-1.fc35.x86_64.rpm http://172.16.8.62/rpm/libunwind-1.5.0-1.fc35.x86_64.rpm http://172.16.8.62/rpm/libusbmuxd-2.0.2-5.fc35.x86_64.rpm http://172.16.8.62/rpm/libvisual-0.4.0-33.fc35.x86_64.rpm http://172.16.8.62/rpm/libvorbis-1.3.7-4.fc35.x86_64.rpm http://172.16.8.62/rpm/libwayland-client-1.20.0-1.fc35.x86_64.rpm http://172.16.8.62/rpm/libwayland-cursor-1.20.0-1.fc35.x86_64.rpm http://172.16.8.62/rpm/libwayland-egl-1.20.0-1.fc35.x86_64.rpm http://172.16.8.62/rpm/libwayland-server-1.20.0-1.fc35.x86_64.rpm http://172.16.8.62/rpm/libwebp-1.2.2-1.fc35.x86_64.rpm http://172.16.8.62/rpm/libX11-1.7.3.1-1.fc35.x86_64.rpm http://172.16.8.62/rpm/libX11-common-1.7.3.1-1.fc35.noarch.rpm http://172.16.8.62/rpm/libX11-xcb-1.7.3.1-1.fc35.x86_64.rpm http://172.16.8.62/rpm/libXau-1.0.9-7.fc35.x86_64.rpm http://172.16.8.62/rpm/libxcb-1.13.1-8.fc35.x86_64.rpm http://172.16.8.62/rpm/libXcomposite-0.4.5-6.fc35.x86_64.rpm http://172.16.8.62/rpm/libXcursor-1.2.0-6.fc35.x86_64.rpm http://172.16.8.62/rpm/libXdamage-1.1.5-6.fc35.x86_64.rpm http://172.16.8.62/rpm/libXext-1.3.4-7.fc35.x86_64.rpm http://172.16.8.62/rpm/libXfixes-6.0.0-2.fc35.x86_64.rpm http://172.16.8.62/rpm/libXft-2.3.3-7.fc35.x86_64.rpm http://172.16.8.62/rpm/libXi-1.7.10-7.fc35.x86_64.rpm http://172.16.8.62/rpm/libXinerama-1.1.4-9.fc35.x86_64.rpm http://172.16.8.62/rpm/libXrandr-1.5.2-7.fc35.x86_64.rpm http://172.16.8.62/rpm/libXrender-0.9.10-15.fc35.x86_64.rpm http://172.16.8.62/rpm/libxshmfence-1.3-9.fc35.x86_64.rpm http://172.16.8.62/rpm/libxslt-1.1.34-6.fc35.x86_64.rpm http://172.16.8.62/rpm/libXtst-1.2.3-15.fc35.x86_64.rpm http://172.16.8.62/rpm/libXv-1.0.11-15.fc35.x86_64.rpm http://172.16.8.62/rpm/libXxf86vm-1.1.4-17.fc35.x86_64.rpm http://172.16.8.62/rpm/mesa-libEGL-21.3.8-2.fc35.x86_64.rpm http://172.16.8.62/rpm/mesa-libgbm-21.3.8-2.fc35.x86_64.rpm http://172.16.8.62/rpm/mesa-libGL-21.3.8-2.fc35.x86_64.rpm http://172.16.8.62/rpm/mesa-libglapi-21.3.8-2.fc35.x86_64.rpm http://172.16.8.62/rpm/openjpeg2-2.4.0-4.fc35.x86_64.rpm http://172.16.8.62/rpm/opus-1.3.1-9.fc35.x86_64.rpm http://172.16.8.62/rpm/orc-0.4.31-5.fc35.x86_64.rpm http://172.16.8.62/rpm/osinfo-db-20220214-1.fc35.noarch.rpm http://172.16.8.62/rpm/osinfo-db-tools-1.9.0-2.fc35.x86_64.rpm http://172.16.8.62/rpm/pango-1.50.4-1.fc35.x86_64.rpm http://172.16.8.62/rpm/poppler-21.08.0-1.fc35.x86_64.rpm http://172.16.8.62/rpm/poppler-data-0.4.9-8.fc35.noarch.rpm http://172.16.8.62/rpm/poppler-glib-21.08.0-1.fc35.x86_64.rpm http://172.16.8.62/rpm/pugixml-1.11.4-3.fc35.x86_64.rpm http://172.16.8.62/rpm/pulseaudio-libs-15.0-2.fc35.x86_64.rpm http://172.16.8.62/rpm/SDL2-2.0.20-1.fc35.x86_64.rpm http://172.16.8.62/rpm/sound-theme-freedesktop-0.8-16.fc35.noarch.rpm http://172.16.8.62/rpm/totem-pl-parser-3.26.6-3.fc35.x86_64.rpm http://172.16.8.62/rpm/tracker-3.2.1-1.fc35.x86_64.rpm http://172.16.8.62/rpm/tracker-miners-3.2.2-1.fc35.x86_64.rpm http://172.16.8.62/rpm/uchardet-0.0.6-14.fc35.x86_64.rpm http://172.16.8.62/rpm/upower-0.99.13-1.fc35.x86_64.rpm http://172.16.8.62/rpm/wxBase3-3.0.5.1-5.fc35.x86_64.rpm http://172.16.8.62/rpm/wxGTK3-3.0.5.1-5.fc35.x86_64.rpm http://172.16.8.62/rpm/wxGTK3-i18n-3.0.5.1-5.fc35.noarch.rpm http://172.16.8.62/rpm/xml-common-0.6.3-57.fc35.noarch.rpm
yum install -y filezilla 2>> /mnt/install.log

# 10) Zoom installation
yum install -y ftp://172.16.8.62/req_apps/zoom_x86_64.rpm 2>> /mnt/install.log

# 11) WPS Office installation
yum install -y ftp://172.16.8.62/req_apps/wps-office.rpm 2>> /mnt/install.log

# 12) Only Office installation
yum install -y ftp://172.16.8.62/req_apps/onlyoffice-desktopeditors.x86_64.rpm 2>> /mnt/install.log

# 13) Snap reposetory installation
yum -y install snapd 2>> /mnt/install.log

# 14) VLC installation.
#yum -y install vlc 2>> /mnt/install.log
yum -y install  ftp://172.16.8.62/req_apps/vlc/compat-lua-libs-5.1.5-19.fc35.x86_64.rpm    ftp://172.16.8.62/req_apps/vlc/faad2-libs-2.10.0-2.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/ffmpeg-libs-4.4.1-7.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/fluidsynth-libs-2.2.5-1.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/freeglut-3.2.2-1.fc35.x86_64.rpm    ftp://172.16.8.62/req_apps/vlc/game-music-emu-0.6.3-6.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/ilbc-1.1.1-21.fc35.x86_64.rpm   ftp://172.16.8.62/req_apps/vlc/intel-mediasdk-21.4.3-1.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/ladspa-1.13-27.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/leptonica-1.81.1-2.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/libass-0.15.2-1.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/libavc1394-0.5.4-16.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/libbs2b-3.1.0-27.fc35.x86_64.rpm    ftp://172.16.8.62/req_apps/vlc/libcaca-0.99-0.59.beta20.fc35.x86_64.rpm    ftp://172.16.8.62/req_apps/vlc/libcddb-1.3.2-35.fc35.x86_64.rpm    ftp://172.16.8.62/req_apps/vlc/libchromaprint-1.5.0-3.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/libdc1394-2.2.6-5.fc35.x86_64.rpm   ftp://172.16.8.62/req_apps/vlc/libdca-0.0.7-4.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/libdvbpsi-1.3.3-5.fc35.x86_64.rpm   ftp://172.16.8.62/req_apps/vlc/libebml-1.4.2-2.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/libkate-0.4.1-23.fc35.x86_64.rpm    ftp://172.16.8.62/req_apps/vlc/libmad-0.15.1b-32.fc35.x86_64.rpm   ftp://172.16.8.62/req_apps/vlc/libmatroska-1.6.3-2.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/libmicrodns-0.2.0-3.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/libmodplug-0.8.9.0-13.fc35.x86_64.rpm   ftp://172.16.8.62/req_apps/vlc/libmpcdec-1.2.6-28.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/libmysofa-1.2.1-1.fc35.x86_64.rpm   ftp://172.16.8.62/req_apps/vlc/libopenmpt-0.5.15-1.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/libplacebo-4.157.0-1.fc35.x86_64.rpm    ftp://172.16.8.62/req_apps/vlc/libraw1394-2.1.2-14.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/librtmp-2.4-20.20190330.gitc5f04a5.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/libshaderc-2021.0-5.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/libspatialaudio-3.1-5.20200406gitd926a2e.fc35.x86_64.rpm    ftp://172.16.8.62/req_apps/vlc/libtiger-0.3.4-22.fc35.x86_64.rpm   ftp://172.16.8.62/req_apps/vlc/libubsan-11.2.1-9.fc35.x86_64.rpm   ftp://172.16.8.62/req_apps/vlc/libupnp-1.14.12-1.fc35.x86_64.rpm   ftp://172.16.8.62/req_apps/vlc/libusb-0.1.7-6.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/libvdpau-1.5-1.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/libvncserver-0.9.13-11.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/lirc-libs-0.10.0-32.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/live555-2022.02.07-1.fc35.x86_64.rpm    ftp://172.16.8.62/req_apps/vlc/mesa-libGLU-9.0.1-5.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/ocl-icd-2.3.0-2.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/opencore-amr-0.1.5-13.fc35.x86_64.rpm   ftp://172.16.8.62/req_apps/vlc/openpgm-5.2.122-27.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/protobuf-lite-3.14.0-7.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/qt5-qtsvg-5.15.2-6.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/rubberband-2.0.1-1.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/schroedinger-1.0.11-25.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/soxr-0.1.3-10.fc35.x86_64.rpm   ftp://172.16.8.62/req_apps/vlc/speexdsp-1.2.0-4.fc35.x86_64.rpm    ftp://172.16.8.62/req_apps/vlc/spirv-tools-libs-2022.1-1.20220202.git45dd184.fc35.x86_64.rpm   ftp://172.16.8.62/req_apps/vlc/srt-libs-1.4.4-1.fc35.x86_64.rpm    ftp://172.16.8.62/req_apps/vlc/tesseract-4.1.3-1.fc35.x86_64.rpm   ftp://172.16.8.62/req_apps/vlc/tesseract-langpack-eng-4.1.0-2.fc35.noarch.rpm  ftp://172.16.8.62/req_apps/vlc/tesseract-tessdata-doc-4.1.0-2.fc35.noarch.rpm  ftp://172.16.8.62/req_apps/vlc/vamp-plugin-sdk-2.9.0-4.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/vapoursynth-libs-51-4.fc35.x86_64.rpm   ftp://172.16.8.62/req_apps/vlc/vid.stab-1.1.0-17.20190213gitaeabc8d.fc35.x86_64.rpm    ftp://172.16.8.62/req_apps/vlc/vlc-3.0.17.2-1.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/vlc-core-3.0.17.2-1.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/vo-amrwbenc-0.1.3-15.fc35.x86_64.rpm    ftp://172.16.8.62/req_apps/vlc/x264-libs-0.163-2.20210613git5db6aa6.fc35.x86_64.rpm    ftp://172.16.8.62/req_apps/vlc/x265-libs-3.5-2.fc35.x86_64.rpm ftp://172.16.8.62/req_apps/vlc/xvidcore-1.3.7-6.fc35.x86_64.rpm    ftp://172.16.8.62/req_apps/vlc/zeromq-4.3.4-2.fc35.x86_64.rpm  ftp://172.16.8.62/req_apps/vlc/zimg-3.0.3-1.fc35.x86_64.rpm


# 15) X11vnc installation and Setup...
yum install -y x11vnc  >> /opt/install.log

x11vnc -storepasswd vncIT@4321 /root/x11vnc.pass 

#Startup on boot 
cat >/etc/systemd/system/x11vnc.service << EOF
[Unit]
Description=VNC Server for X11
Requires=graphical.target
After=graphical.target

[Service]
Type=forking
ExecStart=/usr/bin/x11vnc -xkb -noxrecord -noxfixes -noxdamage -forever -bg -rfbport 5900 -display :0 -auth /var/run/lightdm/root/:0 -rfbauth /root/x11vnc.pass -o /var/log/x11vnc.log

[Install]
WantedBy=default.target
EOF

chmod +x /etc/systemd/system/x11vnc.service
#Creating Service Daemon
systemctl daemon-reload
systemctl restart x11vnc.service >> /opt/install.log
systemctl enable x11vnc.service  >> /opt/install.log

#Reloading Firewall
firewall-cmd --permanent --add-port=5900/tcp >> /opt/install.log
firewall-cmd --reload >> /opt/install.log 
# ./ End of X11vnc installation and Setup............................

# 16) skype installation.
sudo snap install skype 2>> /mnt/install.log


# 17) Network Tools
yum -y install net-tools htop nload mypaint curl jc edid-decode cronie hwinfo.x86_64 pulseaudio-utils

#18)BLMS script
SY_Serial=$(cat /sys/class/dmi/id/product_serial)
hostnamectl set-hostname $SY_Serial.tnl.com
echo $SY_Serial.tnl.com > /etc/hostname
mkdir /var/lib/blms_agent
yum install -y NetworkManager python3 cronie hwinfo.x86_64 dmidecode jc net-tools jq x11vnc
wget -O /etc/systemd/system/x11vnc.service http://172.16.8.62/scripts/x11vnc.service
x11vnc -storepasswd vncIT@4321 /root/x11vnc.pass
systemctl disable x11vnc
systemctl enable x11vnc
systemctl start x11vnc
firewall-cmd --permanent --add-port=5900/tcp
firewall-cmd --permanent --add-port=22/tcp
firewall-cmd --reload
wget -O /var/lib/blms_agent/master.sh http://172.16.8.62/blms/master.sh
wget -O /etc/cron.d/blms_crone_setup http://172.16.8.62/blms/blms_crone_setup
chmod 0644 /etc/cron.d/blms_crone_setup
chmod +x /var/lib/blms_agent/master.sh
sh /var/lib/blms_agent/master.sh
wget -O /etc/cron.d/blms_crone_setup http://172.16.8.62/blms/blms_crone_setup
sh /var/lib/blms_agent/master.sh 
sh /var/lib/blms_agent/agent.sh
#----------------------------------------

#19) Install Zoiper
yum -y install http://172.16.8.62/rpm/zoiper5_5.3.7_x86_64.rpm

#20) libreoffice installation
yum install -y libreoffice

#21) Cynet installation setup
SY_Serial=$(cat /sys/class/dmi/id/product_serial)
hostnamectl set-hostname $SY_Serial.tnl.com
echo $SY_Serial.tnl.com > /etc/hostname
wget -O /tmp/CynetEPSArguments.txt http://172.16.8.62/scripts/Arguments.txt
yum install -y http://172.16.8.62/rpm/cyneteps.rpm

# Reboot after installation  shutdown|reboot|poweroff
reboot


