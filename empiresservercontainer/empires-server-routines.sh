export origindir=$(pwd)
export RUNTIMEDIR=${origindir}/._MEI202028
pkg install python git clang dialog openssh -y
python3 -m pip install virtualenv pipenv
export RaiseTheEmpiresRNTINI=RaiseTheEmpires/RaiseTheEmpires.ini
echo "[Info]" > ${RaiseTheEmpiresRNTINI}
echo "Name=RaiseTheEmpires_GNU_LINUX_EDITION" >> ${RaiseTheEmpiresRNTINI}
echo "URL=https://github.com/AcidCaos/empires-and-allies" >> ${RaiseTheEmpiresRNTINI}
echo "Binary=empires-server" >> ${RaiseTheEmpiresRNTINI}
echo "[InstallFolders]" >> ${RaiseTheEmpiresRNTINI}
echo "InstallPath=${RUNTIMEDIR}" >> ${RaiseTheEmpiresRNTINI}
echo "MyGamesPath=$(pwd)/RaiseTheEmpires/fileSave" >> ${RaiseTheEmpiresRNTINI}
echo "[InstallSettings]" >> ${RaiseTheEmpiresRNTINI}
echo "Arch=$(uname -m)" >> ${RaiseTheEmpiresRNTINI}
export origindir=$(pwd)

#import executionRoutines
. ${origindir}/executionRoutines

registrarServerID
#load serverID paramater
installEnv
# Continue installing and configuring the environment for the runtime
distributionRead
#read distro

HEIGHT=15
WIDTH=80
CHOICE_HEIGHT=18
ver=$(cat ${origindir}/buildnumber)



procTeardown
#Cleanup Leftover by previous session that caused the port to be binded


dialog --msgbox "Welcome to empires-server build ${ver}" 40 40

gamecontentUpdate #update game in the background if its needed already

function menuSel()
{
# we put it in here because of its dynamics
BACKTITLE="empires-server Build ${ver} by RaiseTheEmpires team serverID ${serverID}"
TITLE="Empires And Allies Mission Control"
OPTIONS=(
"StartServer" "Start empires-server"
"Informational" "Informational Control of the Server Logs etc"
"Maintanance" "Server Maintanance Menu"
"exit" "Exit from the empires-server boot menu")


mission=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "Select Action" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)








if [ ${mission} == 'Informational' ]; then
menuInformational
fi
if [ ${mission} == 'Maintanance' ]; then
menuMaintanance
fi

if [ ${mission} == "StartServer" ]; then
menuStart
fi


if [ ${mission} == 'exit' ]; then
exitserver
fi

menuSel

}


function menuMaintanance(){
BACKTITLE="empires-server Build ${ver} by RaiseTheEmpires team serverID ${serverID}"
TITLE="Maintanance Menu"
OPTIONS=(
"requestnewServerID" "Request new server ID if you have a problem on connecting"
"updateServer" "Download latest available stable compiled version"
"RestoreSnapshot" "Restore Save File Snapshot"
"ExportSave" "This will export the save file to your internal storage in RaiseTheEmpires folder"
"ImportSave" "This will import save file that is on RaiseTheEmpires Folder in your internal storage"
"trim" "This will trim the storage usage but sacrifices the snapshot backup" )

mission=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "Select Action" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)




if [ ${mission} == 'updateServer' ]; then
updateManualServer
fi

if [ ${mission} == 'requestnewServerID' ]; then
requestnewServerID
fi

if [ ${mission} == 'RestoreSnapshot' ]; then
snapshotMenu
fi

if [ ${mission} == 'ManualUpdate' ]; then
UpdateSERVER
fi

if [ ${mission} == 'ExportSave' ]; then
ExportSave
fi

if [ ${mission} == 'ImportSave' ]; then
ImportSave
fi


if [ ${mission} == 'trim' ]; then
trimSTG
fi

menuSel
}


function menuInformational(){
BACKTITLE="empires-server Build ${ver} by RaiseTheEmpires team serverID ${serverID}"
TITLE="Informational Menu"
OPTIONS=(
"exportDiagnostic" "export logs to a link so that the developer can review the problem"
"viewlogs" "See how your device run the server"
"changelog" "see the changelog" )

mission=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "Select Action" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

if [ ${mission} == 'changelog' ]; then
changelogsee
fi

if [ ${mission} == 'viewlogs' ]; then
seelogs
fi


if [ ${mission} == 'exportDiagnostic' ]; then
sendlogdev
fi

menuSel
}

function menuStart(){
BACKTITLE="empires-server Build ${ver} by RaiseTheEmpires team serverID ${serverID}"
TITLE="Empires And Allies Mission Control"
OPTIONS=(
"StartOnline" "Start empires-server online"
"StartOffline" "Start Empires-server offline" )

mission=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "Select Action" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)


if [ ${mission} == 'StartOnline' ]; then
serverRun
fi

if [ ${mission} == 'StartOffline' ]; then
serverLocal
fi
menuSel
}


menuSel
