#!/bin/bash 

SLEEP_SCRIPTS_DIR=~/.sleepscripts
LAUNCH_AGENTS_PATH=~/Library/LaunchAgents/
KBOS_PLIST_PATH=~/Library/LaunchAgents/sleepwatch_bluetooth.plist

# Caputre arguments if any
while test $# -gt 0; do
  case "$1" in
    -h|--help)
        echo "**************************************"
        echo "KBOS - Kill Bluetooth on sleep 🔪🎧😴"
        echo "**************************************"
        echo " "
        echo "When run without arguments, this script installs Blueutil and sleepwatcher ( if not installed already ), and configures the two to work together in order to disable bluetooth everytime the computer goes to sleep." 
        echo " "
        echo "options:"
        echo "-h, --help                show brief help"
        echo "-d, --disable             disables KBOS, but doesn't uninstall anything."
        echo "-e, --enable              re-enables KBOS"
        echo "-u, --uninstall           removes the sleepscripts directory and the KBOS Plist. Does NOT uninstall brew, Blueutil, or sleepwatcher."
        exit 0
        ;;
    -d|--disable)
        OUTPUT="$(launchctl unload ${KBOS_PLIST_PATH} 2>&1)"
        if [[ $OUTPUT == "" ]]; then 
            echo "KBOS Disabled ✋🏻"
        else   
            echo "${OUTPUT}"
        fi 
        ;;
    -e|--enable)
        OUTPUT="$(launchctl load ${KBOS_PLIST_PATH} 2>&1)"
        if [[ $OUTPUT == "" ]]; then 
            echo "KBOS Enabled 🔪"
            exit 0;
        else   
            echo "${OUTPUT}"
            exit 0; 
        fi 
        ;;
      -u|--uninstall)
        if [ -d "${SLEEP_SCRIPTS_DIR}" ]; then
            echo "* Removing sleepscripts dir"
            rm -r ${SLEEP_SCRIPTS_DIR}
        fi
        
        if [ -f  "${KBOS_PLIST_PATH}" ]; then
            echo "* Removing Plist"
            rm ${KBOS_PLIST_PATH};
        fi
        echo "* To uninstall Blueutil and Sleepwatcher, please visit https://docs.brew.sh/FAQ#how-do-i-uninstall-a-formula"
        echo "KBOS has successfully been uninstalled 🙅🏽‍♂️"
        ;;
    *)
      echo "${1} is an unknown argument." 
      exit 0;
      ;;
  esac
  exit 0;
done

# Install KBOS
echo "***************************" 
echo "Checking for prerequisites"
echo "***************************"

if [[ $(which brew) == "" ]]; then
    echo "Could not find Hombrew, It's required to install Blueutil. Check it out https://brew.sh/"
    exit 1
else
    echo "** Homebrew OK"
fi

# Check for blueutil
if [[ $(brew ls --versions blueutil) == "" ]]; then
    echo "Could not find blueutil, Installing ..."
    brew install blueutil || exit 1
else
    echo "** Blueutil OK"
fi

# Check for sleepwatcher
if [[ $(brew ls --versions sleepwatcher) == "" ]]; then
    echo "Could not find sleepwatcher, Installing ..."
    brew install sleepwatcher || exit 1
    brew services start sleepwatcher || exit 1
else
    echo "** sleepwatcher OK"
fi

echo " "
echo "***********************" 
echo "Preparing sleep scripts"
echo "***********************" 

# Copy sleepscripts to user directory
mkdir -p ${SLEEP_SCRIPTS_DIR} || exit 1;
cp ./disable_bluetooth.sh ${SLEEP_SCRIPTS_DIR} || exit 1;
cp ./enable_bluetooth.sh ${SLEEP_SCRIPTS_DIR} || exit 1;
chmod +x ${SLEEP_SCRIPTS_DIR}/* || exit 1;
echo "** sleep scripts copied to ~/.sleepscripts"

# Copy plist to ~/Library/LaunchAgents - after creating the directory if it doesn't exist 
mkdir -p ${LAUNCH_AGENTS_PATH} || exit 1;
cp ./sleepwatch_bluetooth.plist ${LAUNCH_AGENTS_PATH} || exit 1;
echo "** sleepwatch_bluetooth.plist copied to  ${LAUNCH_AGENTS_PATH}"
launchctl load ${KBOS_PLIST_PATH}

echo " "
echo "KBOS has been successfully installed 🔪"