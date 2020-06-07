
misalnya kamu ada dua changes nih empires-server.py sama empires-server-anniversaryedition.py
( note : di folder empiresservercontainer/staging_enginepatch/empires-anniversary-edition-kitchen )
command
```
diff -u empires-server.py empires-server-anniversaryedition.py > ../patch/anniversarypatch.patch
```

nah nanti kamu edit di empiresservercontainer/staging_enginepatch/_patchingroutines_ nya tambahin
```
patch "${fakeroot}/raisetheempires-dev/empires-server.py" "${origindir}/staging_enginepatch/patch/anniversarypatch.patch"
```
