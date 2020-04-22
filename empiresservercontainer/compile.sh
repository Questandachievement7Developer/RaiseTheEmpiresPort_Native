#!/bin/bash
#compiler tool
#This tool compiles all of these into one Empires-Server portable executable aarch64
export origindir=$(pwd)
export compileprefix=[EALGNUCompiler]
HEIGHT=15
WIDTH=80
CHOICE_HEIGHT=18
BACKTITLE="empires-server GNU compiler"
TITLE="empires-server GNU compiler"
#installs dependencies python and etc

if [ $(whoami) != 'root' ];then
  echo Launch this script in root
  exit
fi



. ${origindir}/devTool/compileToolset
source ${origindir}/devTool/compileToolset
if [ -z $(which dialog) ]; then #check if qemu static is in place
#sudo pacman -S python dialog base-devel qemu-arch-extra git qemu trizen --noconfirm --needed
#trizen -S qemu-user-static-bin --noconfirm --needed

sudo apt-get install python3 dialog build-essential git -y
fi

#if [ ! -d ${origindir}/devTool/android_* ]; then
#cd ${origindir}/devTool
#wget "https://dl.google.com/android/repository/android-ndk-r21-linux-x86_64.zip"
#mkdir devTool/android_ndk
#unzip android-ndk-r21-linux-x86_64.zip

#wget "https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip"
#mkdir devTool/android_sdk
#unzip sdk-tools-linux-4333796.zip
#fi

# to make sure that ndk-build or sdkmanager able to call within this script
echo ${PATH}
export PATH=${PATH}:${origindir}/devTool/android_ndk:${origindir}/devTool/android_sdk
echo ${PATH}
#sdkmanager
#ndk-build

#breakpoint

if [ ! -d ${origindir}/rootfs ]; then
  sudo chmod -R 777 ${origindir}
fi
#deSanitizeMountrootfs
cleanup # cleaning previous interupted build
# Synchronizing repository

reposync_rteMain

OPTIONS=(
"repoSync" "Download and sync all repo Its a must when you are first time downloading the compiler"
"skip" "skip the repo sync")



REPOSYN=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "Select the target platform" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
if [ ${REPOSYN} == 'repoSync' ]; then
reposync_mainBranch
fi


if [ $(uname -m) != "x86_64" ]; then
echo Please use x86_64 machine to compile this program
exit
fi



echo "${compileprefix} Skipping empires-engine x64 Build"
echo "${compileprefix} Launching empires-server arch selection"

OPTIONS=(

"windows" "use wine64 to cross compile to windows"
"termux" "Compiles for Android termux so it can be run on that platform"
"gnulinux" "compiles to standard gnuLinux Format "
"appleiOS" "compiles to iSH iOS runtime (i686) "
"macOS" "compiles to macOS powered by homebrew ")

instTarget=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "Select the target platform" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)


export packmode=staticbin

#if [ ${instTarget} != 'termux' ]; then
#Architechture Selection
#                OPTIONS=(
#                "x86_64" "Compiles to x86_64 bin format"
#                "armv8" "compiles to armv8 or aarch64 bin format"
#                "armv7" "compiles to armv7 bin format")
#
#                Arch=$(dialog --clear \
#                                --backtitle "$BACKTITLE" \
#                                --title "Select the target platform" \
#                                --menu "$MENU" \
#                                $HEIGHT $WIDTH $CHOICE_HEIGHT \
#                                "${OPTIONS[@]}" \
#                                2>&1 >/dev/tty)


#else
export Arch=x86_64
#fi
#compiles the dependencies and binaries first

#this is really simple Compiler dont make it complicated
buildNumberRequest
sleep 3
compileUniversal
assembleServer
bindistTrimming
packallupfordist
echo ${Arch} > ${origindir}/lastCompileArch
cleanup # cleaning previous interupted build
