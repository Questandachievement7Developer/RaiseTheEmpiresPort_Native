## IMPORT MODULE
# P.S idk how to write python so if it familiar to bash im sorry xd
import os
import sys
import getopt
import time
from time import sleep
import locale
import json
import shutil
from threading import Thread
locale.setlocale(locale.LC_ALL, '')
from datetime import datetime
#### OSCHECK ########
if os.name == 'nt':
    OSDETECT = "NTOS"
else:
    OSDETECT = "NIX"
# Checking function
#OSDETECT = "NTOS"
# Why rewrite the executionRoutines?
# We want this server to be POSIX compliant and not to rely on Windows or bash
# Also python are easier to debug thus much faster prototyping speed
CurrentPATH = os.getcwd()
origindir = os.getcwd()
runtimeMEI = origindir + "/._MEI202028"
empiresserver = runtimeMEI + "/empires-server.py"

###########################################################
## file I/O Define
# w+ write and if not exist will created
# a append
# w write
# r  read
def readFile(file):
    rF=open(file, "r")
    output=rF.read()
    return output

def writeFile(file, content):
    rF=open(file, "w+")
    output=rF.write(content)

def cp(source, target):
    shutil.copy(source, target, follow_symlinks=True)

def mv(source, target):
    shutil.move(source, target)

def ls(target):
    output=os.listdir(target)
    return output

def cpRecursive(source, target):
    for file in glob.glob(source):
        print(source)
        cp(file, target)

def mvRecursive(source, target):
    for file in glob.glob(source):
        print(source)
        mv(file, target)

######################UPDATE DEPENDENCIES#####################

os.system("python3 -m easy_install pip")
os.system("python3 -m pip install inquirer pythondialog pyfiglet tendo py3amf flask flask_session flask_sqlalchemy flask_compress flask_socketio daiquiri git+git://github.com/christhechris/libscrc pprint python-editor ")
#dialog for windows
#http://andrear.altervista.org/contents/pc/dialog/dialog-exe-mingw.zip



##############################################################
#after dependencies install Import
from pprint import pprint
import inquirer
import urllib.request
from dialog import Dialog
from pyfiglet import Figlet
#define build version
ver = readFile(origindir + "/buildnumber")
# dialog binary define
# You may want to use 'autowidgetsize=True' here (requires pythondialog >= 3.1)\
## Menu selection Theme define
d = Dialog(dialog="dialog")
d.set_background_title(str("empires-server Build " + ver + " by RaiseTheEmpires team"))
#################################################################
d.msgbox("Welcome to empires-server build " + ver)



if OSDETECT == "NTOS" :
    print("OS DETECT NT KERNEL BASED SYSTEM NON NIX")
    url = 'http://andrear.altervista.org/contents/pc/dialog/dialog-exe-mingw.zip'
    winexec = os.getcwd() + "/winexec"
    os.mkdir(winexec)
    urllib.request.urlretrieve(url, 'winexec' + "/dialogWin.zip")

#
f = Figlet(font='slant')
print(f.renderText('RaiseTheEmpires'))
sleep(2)


###############################################################
# Services Badge
infoSnapshot = "[EALSNAPSHOT]:"
stgmanager = "[StorageManager]:"
serverThread = "[mainServerThread]:"
# Folders Define
snapshotdir = origindir + "/saveSnapshot"
defaultfilesave = origindir + "/RaiseTheEmpires/fileSave"
EALsdcardAndroid = "/sdcard/RaiseTheEmpires"






####################### FUNCTION DEFINE #######################

def clear():
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")




def portingTest():
    print("=================sh2py TEST=======================")
    print("Integration test.....")
    print("Dir Listing Program Using ls" + str(ls(origindir)) )
    print("Dir Listing Program Using listdir" + str(os.listdir(origindir)) )
    print("Dir Listing Program Using listdir" + str(os.listdir(snapshotdir)) )
    print("execDir " + CurrentPATH + "origindir " + origindir + "snapshotdir" + snapshotdir + "Default filesave" + defaultfilesave)
    print(datetime.now())
    print("==================================================")
    sleep(2)


def menuSel():
    confirmationmainmenu, MAINMENU = d.menu("Select Action",
                       choices=[("Start", "Start empires-server"),
                                ("IntegrationTest", "Debug executionRoutines to check if all compatible"),
                                ("changelog", "see the changelog"),
                                ("createSnapshot", "Make snapshot of current state"),
                                ("RestoreSnapshot", "Restore Save File Snapshot"),
                                ("ManualUpdate", "Triggers the empires-server to update manually if you had downloaded the newest version but not updated"),
                                ("MigratetoPC", "Export your save file into your Internal storage if you are using android"),
                                ("MigratetoTermux", "This will import save file on RaiseTheEmpires folder on the internal storage if you use android"),
                                ("trim", "This will trim the storage usage but sacrifices the snapshot backup"),
                                ("exit", "Exut frin the empires-server boot menu")])
    print("DEBUG:" + str(MAINMENU))

    return MAINMENU


def snapshotNOW():
    print("Executing Snapshot NOW")
    snapshotTime = datetime.now()
    #String conversion https://stackoverflow.com/questions/3204614/how-to-change-any-data-type-into-a-string-in-python
    print(infoSnapshot + "Creating save file Snapshot" + str(snapshotTime) )
    if not os.path.exists(snapshotdir): #https://linuxize.com/post/python-check-if-file-exists/
            os.mkdir(snapshotdir)
    os.mkdir(snapshotdir + "/" + str(snapshotTime))

def periodicsnapShotThread():
    print("Executing Snapshot")
    snapshotTime = datetime.now()
    #String conversion https://stackoverflow.com/questions/3204614/how-to-change-any-data-type-into-a-string-in-python
    print(infoSnapshot + "Creating save file Snapshot" + str(snapshotTime) )
    if not os.path.exists(snapshotdir): #https://linuxize.com/post/python-check-if-file-exists/
            os.mkdir(snapshotdir)
    os.mkdir(snapshotdir + "/" + str(snapshotTime))


def migratetoMain():
    print("Exporting into main version of save File")
    sleep(2)
    if not os.path.exists(EALsdcardAndroid):
        os.mkdir(EALsdcardAndroid)
    cp(defaultfilesave + "/*", EALsdcardAndroid)

def MaintoGNU():
    print("Importing from main version into GNU version")
    if not os.path.exists(EALsdcardAndroid):
        return "No such save file detected"
    else:
        cp(EALsdcardAndroid + "/*", defaultfilesave)
    print("Operation Done")

def runtimeMEISetup():
    if not os.path.exists(snapshotdir): #https://linuxize.com/post/python-check-if-file-exists/
            os.mkdir(runtimeMEI)
    if not os.path.exists(runtimeMEI + "empires-server.py"):
        mvRecursive( origindir + "/RaiseTheEmpires/*" , runtimeMEI)
    if not os.path.exists(defaultfilesave):
        cp( runtimeMEI + "/fileSave", defaultfilesave)


def changelog():
    changelogs=readFile(origindir + "/changelog.txt")
    print(changelogs)
    print("This changelog window will automatically closed within 60 seconds")
    sleep(60)

def trimSTG():
    print(stgmanager + "Reducing Storage Usage")
    sleep(2)
    os.remove(snapshotdir + "/*")
    print(stgmanager + "Done")

def serverinitThread():
    print(serverThread + "Initializing Server")
    exec(empiresserver)

def portForwarding():
    print("========================Connect Here to play==========================")
    os.system("ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=360 -R 80:localhost:5005 ssh.localhost.run")

def run():
    periodicsnapShotThread()
    runtimeMEISetup()
    empiresInit = Thread(target=serverinitThread) #https://www.shanelynn.ie/using-python-threading-for-multiple-results-queue/
    empiresInit.start()
    serverinitThread()
    portForwarding()

def restoreSnapshotSave():
    clear()
    questions = [
    inquirer.List(
        "restore",
        message="At what time should i restore?",
        choices=ls(snapshotdir),
    ),
    ]
    answers = json.loads(str(inquirer.prompt(questions)))
    print(answers["folder"])
    sleep(2)


#selection Execute
def SelExec(PICK):
    print(PICK)
    if PICK == "changelog":
        changelog()
    if PICK == "Start":
        run()
    if PICK == "exit":
        exit()
    if PICK == "MigratetoPC":
        migratetoMain()
    if PICK == "MigratetoTermux":
        MaintoGNU()
    if PICK == "RestoreSnapshot":
        restoreSnapshotSave()
    if PICK == "IntegrationTest":
        portingTest()
    if PICK == "createSnapshot":
        snapshotNOW()

# menu selection
def UserInterface():
    PICK=menuSel()
    SelExec(PICK)
    UserInterface()


################################################################
def main():
    snapshotNOW()
    portingTest()
    UserInterface()

if __name__== "__main__":
    main()
################################################################
