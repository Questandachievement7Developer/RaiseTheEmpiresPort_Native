sudo apt-get install python3 python3-setuptools python3-dev git dialog ssh -y
sudo pacman -S python git dialog python-setuptools openssh --noconfirm
python3 -m pip install tendo py3amf flask flask_session flask_sqlalchemy flask_compress flask_socketio daiquiri git+git://github.com/christhechris/libscrc python-editor
export RaiseTheEmpiresRNTINI=RaiseTheEmpires/RaiseTheEmpires.ini
echo "[Info]" > ${RaiseTheEmpiresRNTINI}
echo "Name=RaiseTheEmpires_GNU_LINUX_EDITION" >> ${RaiseTheEmpiresRNTINI}
echo "URL=https://github.com/AcidCaos/empires-and-allies" >> ${RaiseTheEmpiresRNTINI}
echo "Binary=empires-server" >> ${RaiseTheEmpiresRNTINI}
echo "[InstallFolders]" >> ${RaiseTheEmpiresRNTINI}
echo "InstallPath=$(pwd)/RaiseTheEmpires" >> ${RaiseTheEmpiresRNTINI}
echo "MyGamesPath=$(pwd)/RaiseTheEmpires/fileSave" >> ${RaiseTheEmpiresRNTINI}
echo "[InstallSettings]" >> ${RaiseTheEmpiresRNTINI}
echo "Arch=$(uname -m)" >> ${RaiseTheEmpiresRNTINI}
export TMPDIR=$(pwd)/RaiseTheEmpires/RNT
export origindir=$(pwd)
python3 executionRoutines_universal.py
