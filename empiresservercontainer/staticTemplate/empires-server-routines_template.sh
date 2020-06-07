#!/data/data/com.termux/files/usr/bin/bash
#This is the aarch64 translation Helper routines
unset LD_PRELOAD
export empiresPrefix="[Empires-Server-Loader]"
export mountPoints="-b /dev -b /proc -b /data/data/com.termux/files/home:/root"
export ENVBIN=$(which env)
##Bootloader

##BOOTLOADER EMULATED ROOT
BL="proot"
BL+=" --link2symlink"
BL+=" -0"
BL+=" -r rootfs"
if [ -n "\$(ls -A binds)" ]; then
    for f in binds/* ;do
      . \$f
    done
fi
BL+=" -b /dev"
BL+=" -b /proc"
## uncomment the following line to have access to the home directory of termux
#BL+=" -b /data/data/com.termux/files/home:/root"
## uncomment the following line to mount /sdcard directly to /
#BL+=" -b /sdcard"
BL+=" -w /x64EMU" #directly run on x64EMU
BL+=" /usr/bin/env -i"
BL+=" HOME=/root"
BL+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
BL+=" TERM=\$TERM"
BL+=" LANG=C.UTF-8"
BL+=" DISPLAY=:0"
BL+=" PULSE_SERVER=127.0.0.1"
#BL+=" /bin/bash --login"



###BOOTLOADERNONROOT
BLNR="proot"
BLNR+=" --link2symlink"
#BLNR+=" -0" This is for root
BLNR+=" -r rootfs"
if [ -n "\$(ls -A binds)" ]; then
    for f in binds/* ;do
      . \$f
    done
fi
BLNR+=" -b /dev"
BLNR+=" -b /proc"
## uncomment the following line to have access to the home directory of termux
#BL+=" -b /data/data/com.termux/files/home:/root"
## uncomment the following line to mount /sdcard directly to /
#BL+=" -b /sdcard"
BLNR+=" -w /x64EMU" #directly run on x64EMU
BLNR+=" /usr/bin/env -i"
BLNR+=" HOME=/root"
BLNR+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
BLNR+=" TERM=\$TERM"
BLNR+=" LANG=C.UTF-8"
BLNR+=" DISPLAY=:0"
BLNR+=" PULSE_SERVER=127.0.0.1"
#BL+=" /bin/bash --login"




#${ENVBIN}

#install pepperflash
if [ ! -f pepperflashinstalled ]; then
echo "${empiresPrefix} Refreshing Flash Player"
${BL} /usr/bin/wget "http://launchpadlibrarian.net/238653112/browser-plugin-freshplayer-pepperflash_0.3.4-3_arm64.deb"
${BL} /usr/bin/ar -xf "browser-plugin-freshplayer-pepperflash_0.3.4-3_arm64.deb"
${BL} /usr/bin/tar -xf "data.tar.xz"
${BL} /usr/bin/cp -rv usr /
${BL} /usr/bin/rm -rf *.deb usr *tar.xz
echo done > pepperflashinstalled
fi

#Setting up parameter for launching Things
echo "$empiresPrefix Launching Chromium"
echo "Please launch XSERVERXSDL to continue booting"
echo "If its error please wait for couple of minutes to load"
runtimeDWM=$(${BLNR} /usr/bin/openbox) &
runtimeChromium=$(${BLNR} /usr/bin/chromium 127.0.0.1:4610) &
sleep 5
echo "$empiresPrefix Launching x64 Empires-Allies-Server"
sleep 4
runtimeEALServer=$(${BL} /bin/bash /empires-server)
