
![Empires & Allies](empiresservercontainer/rte_staging_assets/templates/layouts/logo.png "Empires & Allies logo")
[![Gitpod Ready-to-Code](https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/Questandachievement7Developer/RaiseTheEmpiresPort_Native)


> Empires and Allies(Facebook) officially closed June 17th, 2013


:world_map: [Main Repo](https://github.com/AcidCaos/raisetheempires)

The Old Empires & Allies preservation project by the Raise the Empires team.
This project is dedicated to preserving and renewing this Flash game so that it's not lost to time.

## Current Status
| Things | Parameter |
| ------- | ------ |
| Current Developed Build | ![version](https://img.shields.io/badge/build-470-blue) |
| Current Stable Releases | ![version](https://img.shields.io/badge/build-470-blue) |
| Current Built Server Size | [![size](https://img.shields.io/badge/size-498%20MB-brightgreen)](#) |
| Current Source Size | [![size](https://img.shields.io/badge/size-30%20MB-brightgreen)](#) |


## Some Notice
```
 The development on port_native is slowed down immensely due to the migration towards seamless GUI EAL interface the port_native will be migrated to a newer architechture which uses GUI frontend that currently under heavy development, thank you for reading this message

```


## Releases

| Build | Update | Release date  | Download |
| ------- | ------ | ------------  | -------- |
| 467~470 | Platform Trial, ssh keyfixes, Content update merge with version 0.06a | July, 2020 | :tickets: [Single Script Archive](https://github.com/Questandachievement7Developer/RaiseTheEmpiresPort_Native/releases/tag/Build_46x)
| 450 | Added support for new termux dependencies | June, 2020 | :tickets: [Single Script Archive](https://github.com/Questandachievement7Developer/RaiseTheEmpiresPort_Native/releases/tag/Build_450) |
| 416~418 | ServerID implementation, Virtualenv dependencies, etc.. | May, 2020 | :tickets: [Single Script Archive](https://github.com/Questandachievement7Developer/RaiseTheEmpiresPort_Native/releases/tag/Build_416) |
| 319~325 | Invading feature, Major bug fixes, Stability improvement, etc.. | April, 2020 | :tickets: [Single Script Archive](https://github.com/Questandachievement7Developer/RaiseTheEmpiresPort_Native/releases/tag/Build_319) |
| 260 | Invade neighbors initial for Build 319 | April, 2020 | :tickets: [Single Script Archive](https://github.com/Questandachievement7Developer/RaiseTheEmpiresPort_Native/releases/tag/Build_260) |
| 239~257 | Base32 and base64 Encoder, Liveupdate | April, 2020 | [Quality Control failed] |
| 210 | Added Local mode feature & Stability improvements | April, 2020 | :tickets: [Single Script Archive](https://github.com/Questandachievement7Developer/RaiseTheEmpiresPort_Native/releases/tag/Build_210) |
| 201 | New Welcome screen & Simpler installation with 'curl' | April, 2020 | :tickets: [Single Script Archive](https://github.com/Questandachievement7Developer/RaiseTheEmpiresPort_Native/releases/tag/Build_201) |
| 193 | Custom ssh config & Merge with new main repo | April, 2020 | :tickets: [Single Script Archive](https://github.com/Questandachievement7Developer/RaiseTheEmpiresPort_Native/releases/tag/Build_193) |
| 185 | UI Overhaul & Additional bonus decorations | March, 2020 | :tickets: [Single Script Archive](https://github.com/Questandachievement7Developer/RaiseTheEmpiresPort_Native/releases/tag/Build_185) |
| 171 | Initial for UI Overhaul | March, 2020 | [Quality Control failed] |
| 129 | Multiplayer Update Merge with version 0.05a   | February, 2020    | :tickets: [Single Script Archive](http://tiny.cc/RaiseTheEmpires_129) |
| 119 | Automatic Host forwarding | January, 2020 | :tickets: [Single Script Archive](http://tiny.cc/EALSERVE119) |
| 99  | Initial Host forwarding | January, 2020 | [Quality Control failed] |
| 57~58 | First initial Release on android x86 and GNU systems natively | January, 2020 | :tickets: [Single Script Archive](http://tiny.cc/RaiseTheEmpires2020_01_24) |
| 20  | Released noArch version | January, 2020 | :tickets: [Single Script Archive](http://tiny.cc/RaiseTheEmpires29TNoArch) |
> Single Script Archive is a single installation file that automates the installation of the server ( Same as a setup wizard in windows but custom built ). Now you don't even need to download the file, just copy paste the command below

## How to install ?
### Installing on Android using Termux
1. Install Termux and Puffin Browser from Play Store
2. Copy paste this command to Termux:
```
curl -s "https://raw.githubusercontent.com/Questandachievement7Developer/RaiseTheEmpiresPort_Native/master/empiresservercontainer/devTool/TermuxAutoinstaller" | bash -
./empires-server-termux
bash
```
3. If there's confirmation [Y/n]..?, just type Y
4. Wait until the installation is completed (and make sure your internet is stable)
5. After the empires-server is running, copy the link into the Puffin Browser

*Done!*

If you want to run it next time, just type this:
```
empires-server
```


> Tip: If the installation often failed / takes too long, try to use VPN



### Installing on GNU/Linux/Ubuntu
1. Assuming that you have terminal opened
2. Copy paste this command to terminal
```
sudo curl -s "https://raw.githubusercontent.com/Questandachievement7Developer/RaiseTheEmpiresPort_Native/master/empiresservercontainer/devTool/GNULinuxAutoinstaller" | bash -
sudo ./empires-server-gnulinux
bash
```
3. If you want to run it next time, just type this:
```
empires-server
```

### Installing on macOS
1. Open the Terminal app
2. Copy paste these command to terminal
```
/bin/bash -c "$(curl -s "https://raw.githubusercontent.com/Questandachievement7Developer/RaiseTheEmpiresPort_Native/master/empiresservercontainer/devTool/macOSautoinstaller" | bash -)"
./empires-server-macOS
```
3. If you want to run it next time, just type this:
```
empires-server
```

### Installing on iOS/iPadOS
1. Install testflight in appstore
2. Install iSH from this link https://testflight.apple.com/join/97i7KM8O
3. Install photonX for the flash browser
4. Copy paste this command in iSH
```
/bin/bash -c "$(curl -s "https://raw.githubusercontent.com/Questandachievement7Developer/RaiseTheEmpiresPort_Native/master/empiresservercontainer/devTool/iOSautoinstaller" | bash -)"
./empires-server-appleiOS
```
If you want to run it next time, just type this:
```
empires-server
```


## Feels confused about the installation setup or anything wanted to implemented in this version?
Feel free to contact to these: <br>
:email: questandachievement@gmail.com  <br>
Personal Discord Yuuta kun#5097 <br>
Our community discord [Discord group](https://discord.gg/xrNE6Hg)
> Don't hestitate to ask we will help you and we won't kill you if you ask so many questions xd


## Reporting Bugs and Contacting
:speech_balloon: Check our Community [Discord group](https://discord.gg/xrNE6Hg)  [![Discord Channel](https://img.shields.io/discord/536575691563466772?label=)](https://discord.gg/xrNE6Hg)



## Tools

:world_map: [Empires & Allies Empire Map Editor](https://github.com/AcidCaos/ea-empire-editor)

:minidisc: [Empires & Allies Servers Support](https://github.com/AcidCaos/raisetheempires/blob/master/SERVERS.md)

## External Links
:beginner: [Empires & Allies Wiki (FANDOM)](https://empiresandallies.fandom.com/wiki/Empires_%26_Allies_Wiki/Main_2)

:clapper: [Empires & Allies Trailer](https://www.youtube.com/watch?v=pAdlyz9miqo)

:smiley_cat: [Empires & Allies subreddit](https://reddit.com/r/EmpiresAndAllies)

## On archives and accessibility to digital heritage
- [Exemption to PCCPSACT](https://www.federalregister.gov/documents/2018/10/26/2018-23241/exemption-to-prohibition-on-circumvention-of-copyright-protection-systems-for-access-control), exemptions to the provision of the Digital Millennium Copyright Act (“DMCA”).
- [EFGAMP](https://efgamp.eu/), the European Federation of Video Game Archives, Museums and Preservation projects.
- [UNESCO PERSIST Programme](https://unescopersist.org/), helps ensure that digital information can continue to be accessed in the future.
- [The Internet Archive](https://archive.org/), a digital library of Internet sites and other cultural artifacts in digital form.
- [BlueMaxima's Flashpoint](https://bluemaxima.org/flashpoint/), the webgame preservation project.

<br><br>
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue)](http://www.gnu.org/licenses/gpl-3.0)
```
Old Empires and Allies preservation project Copyright (C) 2019-2020 by the Raise the Empires team.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```
