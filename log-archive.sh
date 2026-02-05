#!/bin/bash

#### Read Argument passed when executing ####

logDirectory=$1

#### Check if argument was provided, exit if not ####

if [[ $logDirectory == "" ]]
then
    echo "Please provide the log directory name as an argument"
    exit 1
fi

#### Output where the logs will be stored ####
#### Project folder so sudo is not required ####

directoryName="archived_logs"

echo -e "Archived logs are stored in $(pwd)/$directoryName"

#### Get current date and time in YYYYMMDD and HHMMSS format

date=$(date +%y%m%d)
time=$(date +%H%M%S)

#### Set the Logfile-name ####

logName="logs_archive_$date_$time.tar.gz"

#### Check if logDirectory exists, or create ####

logDirectoryPath="$(pwd)/$directoryName"

if [ ! -d "$logDirectoryPath" ]
then
    mkdir "$logDirectoryPath"
fi

#### Set the log-path ####
logPath="$logDirectoryPath/$logName"


tar --create --verbose --gzip --file=$logPath $logDirectory

#### Write own log ####

#### Get timestamp in user-friendly format ####
timestamp=$(date +"%Y-%m-%d %H:%M:%S")


#### write to file
echo "$timestamp | $logName | $logDirectory" >> archive.log