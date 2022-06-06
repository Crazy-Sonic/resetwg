#!/bin/bash
ip=xxx.xxx.xxx.xxx;                                                            #IP zum Backaupserver
count=5;                                                                  #Achtung nicht mehr als 9 angeben da grep sonst die 0 von der 10 als gefunden erkennt.

d=$(date +%y-%m-%d_%H:%M:%S);                                             #Datum für Logfile generieren
echo $d "Checking connection...";

if ping -c $count $ip |grep " 0 received";                                #Ping durchführen

        then    d=$(date +%y-%m-%d_%H:%M:%S);                             # Wenn Ping 0 Received meldet
                echo $d "The connection is lost, try to reconnect!";
                /sbin/service wg-quick@xxxxx restart                     # Tunnel neu starten

        else    d=$(date +%y-%m-%d_%H:%M:%S);                             #Wenn Ping nichts meldet
                echo $d "The connection is Ok, nothing to do.";
fi
