#/usr/bin/env bash

# Main exports
export EXEC_SCRIPT_PATH=$(pwd)
export SCRIPT_PATH=$(dirname "$EXEC_SCRIPT_PATH")
export TFTP_PATH=$(dirname "$SCRIPT_PATH")
export TMP="/tmp/"$(date +"%Y%m%d" | md5sum | awk '{print $1}')
[ ! -d $TMP ] && mkdir $TMP

# Colors               
export CRED="\x1b[31;01m"     
export CBLUE="\x1b[34;01m"    
export CGRAY="\x1b[30;01m"    
export CRESET="\x1b[39;49;00m"

# Functions
function info() {
	echo -e "$CBLUE"$@"$CRESET";
}
function debug() {
	echo -e "$CGRAY"$@"$CRESET";
}
function warning() {
	echo -e "$CRED"$@"$CRESET";
}

#info " Configuration file loaded"
#info "==========================="
#debug "TFTP path    > "$TFTP_PATH
#debug "Scripts path > "$SCRIPT_PATH
