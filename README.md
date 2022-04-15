# PIDinfo
Detailed info about PID

## Usage

1. Run the script, specify PID and TIMEOUT:

    ./PIDinfo.sh PID TIMEOUT

## To do:
  Get PID from process name like this:
  ```bash
  PID = $(pidof "${PIDname}" | sed 's/\([0-9]*\)/-p \1/g')
  ```
