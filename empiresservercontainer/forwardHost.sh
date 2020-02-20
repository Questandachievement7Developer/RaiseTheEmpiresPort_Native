#!/bin/sh


echo '====================[Invitation Link]======================'
echo 'Please connect through this'
ssh -T -o "StrictHostKeyChecking=no" -o "ServerAliveInterval=60" -R 80:localhost:5005 ssh.localhost.run
if [ -f  killsigforwardHost ]; then
  rm killsigforwardHost
  exit
fi
echo '=====================[Multiplayer Plateu]=================='
