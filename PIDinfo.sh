#!/bin/bash

set -e

PID=$1
TIMEOUT=$2

run_strace() {
    n=`ps aux| awk '$2~/^'$PID'$/{print $11}'| wc -l`
    if [ $n -eq 0 ];then
     echo "PID does not exist"
     exit
    fi
    echo "--------------------------------"
    echo "PID: $PID"
    echo "Command:`ps aux| awk '$2~/^'$PID'$/{print $11}'`"
    echo "User: `ps aux| awk '$2~/^'$PID'$/{print $1}'`"
    echo "CPU usage: `ps aux| awk '$2~/^'$PID'$/{print $3}'`%"
    echo "RAM usage：`ps aux| awk '$2~/^'$PID'$/{print $4}'`%"
    echo "Момент запуска процесса:：`ps aux| awk '$2~/^'$PID'$/{print $9}'`"
    echo "Время выполнения процесса：`ps aux| awk '$2~/^'$PID'$/{print $10}'`"
    echo "Status：`ps aux| awk '$2~/^'$PID'$/{print $8}'`"
    echo "VIRT MEM:：`ps aux| awk '$2~/^'$PID'$/{print $5}'`"
    echo "Shared MEM:：`ps aux| awk '$2~/^'$PID'$/{print $6}'`"
    echo "--------------------------------"

    timeout $TIMEOUT strace -fftttT -p $PID -o $PID-strace.txt
}

if [[ $# -ne 2 || $1 == '-h' || $1 == '--help' ]]; then
    echo "Usage: ./PIDinfo.sh <PID ID> <Timeout>"
    exit 1
else
    run_strace $1 $2
    echo "saved: $1-strace.txt"
    python3 Parser.py $1-strace.txt
fi

exit
