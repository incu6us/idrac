#!/bin/bash

JAVA_PATH="java"

if [ `$JAVA_PATH -version 2>&1 >/dev/null | grep 'java version' | awk '{print $3}'|sed 's/"//g'|awk -F '_' '{print $1}'` == "1.7.0" ];then

  echo -n 'Host: '
  read drachost

  echo -n 'Username: '
  read dracuser

  echo -n 'Password: '
  read -s dracpwd
  echo

  $JAVA_PATH -cp avctKVM.jar -Djava.library.path=./libs com.avocent.idrac.kvm.Main ip=$drachost kmport=5900 vport=5900 user=$dracuser passwd=$dracpwd apcp=1 version=2 vmprivilege=true "helpurl=https://$drachost:443/help/contents.html"
else
  echo "Use java 1.7.0 instead "`$JAVA_PATH -version`
fi
