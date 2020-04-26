export origindir=$(pwd)
export RUNTIMEDIR=${origindir}/._MEI202028
pkg install python git clang dialog openssh -y
python -m pip install tendo py3amf flask flask_session flask_sqlalchemy flask_compress flask_socketio daiquiri git+git://github.com/christhechris/libscrc python-editor
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
HEIGHT=15
WIDTH=80
CHOICE_HEIGHT=18
ver=$(cat ${origindir}/buildnumber)
BACKTITLE="empires-server Build ${ver} by RaiseTheEmpires team"
TITLE="Empires And Allies Mission Control"
#import executionCall
. ${origindir}/executionRoutines






dialog --msgbox "Welcome to empires-server build ${ver}" 40 40

gamecontentUpdate #update game in the background if its needed already

function menuSel()
{
OPTIONS=(
"Start" "Start empires-server online"
"StartLocally" "Connect server to PC locally"
"changelog" "see the changelog"
"RestoreSnapshot" "Restore Save File Snapshot"
"ExportSave" "This will export the save file to your internal storage in RaiseTheEmpires folder"
"ImportSave" "This will import save file that is on RaiseTheEmpires Folder in your internal storage "
"trim" "This will trim the storage usage but sacrifices the snapshot backup"
"exit" "Exit from the empires-server boot menu")


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

if [ ${mission} == 'Start' ]; then
serverRun
fi

if [ ${mission} == 'StartLocally' ]; then
serverLocal
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

if [ ${mission} == 'exit' ]; then
exitserver
fi

menuSel

}

menuSel
