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
pkginstall "python3 dialog build-essential git"

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
cleanup # cleaning previous interupted build

reposync_rteMain
startupMenu(){
if [ -z ${compilealltrigger} ]; then

OPTIONS=(
"" '>>>>> Version <<<<<'
"" "Port_native Build $(cat ${origindir}/buildnumber)"
"" "Compiler Version $(cd ${origindir}/.. ; git log -1 --format=%cd)"
"==========" "===================Compile Action=========================="
"Compile" "skip the repo sync"
"buildtest" "check current build stability"
"compileall" "skip the reposync and compile all platforms only for termux macOS gnulinux"
"==========" "===================Repo Action============================="
"repoSync" "Download and sync all repo Its a must when you are first time downloading the compiler and then proceed compile"
"localPushRemote" "Push local compiler update to the remote git"
"localegen" "Generate Languages Compilation")



ACTION=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "Select the Action" \
                --menu "$MENU" \
                27 120 $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

#welp if the devloper is bored and decided to go to this menu instead
if [ -z ${ACTION} ]; then
  startupMenu
  exit
fi
if [ ${ACTION} == "==========" ]; then
startupMenu
exit
fi


if [ ${ACTION} == 'repoSync' ]; then
reposync_mainBranch
startupMenu
exit
fi

if [ ${ACTION} == 'localegen' ]; then
xmlTranslator
sleep 5
startupMenu
exit
fi

if [ ${ACTION} == 'buildtest' ]; then
export instTarget="gnulinux"
sanitybuildcheck
startupMenu
exit
fi

if [ ${ACTION} == 'localPushRemote' ]; then
repopush_mainBranch
startupMenu
exit
fi



if [ ${ACTION} == 'Compile' ]; then
compileInitiator
exit
fi

if [ ${ACTION} == "compileall" ]; then
export compilealltrigger=1
listofplatform="termux gnulinux macOS"
for a in ${listofplatform}; do
export instTarget="${a}"
bulkBuild
done
exit
fi


fi
}
compileInitiator(){
export instTarget=""
if [ $(uname -m) != "x86_64" ]; then
echo it is recomended to use x86_64 machine to compile this program
fi

if [ -z ${instTarget} ]; then

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

fi

if [ -z ${instTarget} ]; then
  startupMenu
  exit
fi

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

#fi
#compiles the dependencies and binaries first

#this is really simple Compiler dont make it complicated
buildTHESERVER
exit
}
#_______MAIN_______
startupMenu
