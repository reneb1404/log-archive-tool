#!/bin/bash

#### Read Argument passed when executing ####

directoryName=$1

#### Check if argument was provided, exit if not ####

if [[ $directoryName == "" ]]
then
    echo "Please provide the log directory name as an argument"
    exit 1
fi

#### Output where the logs will be stored ####
#### Project folder so sudo is not required ###ä

echo -e "Archived logs are stored in $(pwd)/$directoryName"

#### Get current date and time in YYYYMMDD and HHMMSS format

date=$(date +%y%m%d)
time=$(date +%H%M%S)

#### Set the logfile-name ####

logName="logs_archive_$date_$time.tar.gz"

#### check if logDirectory exists, if not create it

logDirectory="$(pwd)/$directoryName"

if [ ! -d "$logDirectory" ]
then
    mkdir $logDirectory
fi

#### set the log-path ####

logPath="$logDirectory/$logName"

#### Use tar and gzip to compress the logs ####

tar --create --verbose --gzip --file=$logPath test