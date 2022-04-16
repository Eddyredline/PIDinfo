# PIDinfo
Detailed info about PID

## Usage

1. Run the script, specify PID and TIMEOUT:

    ./PIDinfo.sh PID TIMEOUT
    
## Result
  ```bash
[root@799f4f2e03e849fd904acc03f4172abf1c PIDinfo]# ps -aux | grep top
cloud_u+    3034  0.1  0.2 275188  4488 pts/2    S+   15:18   0:02 top
root        3924  0.0  0.0 221900  1044 pts/0    R+   15:47   0:00 grep --color=auto top
[root@799f4f2e03e849fd904acc03f4172abf1c PIDinfo]# ./PIDinfo.sh 3034 5
--------------------------------
PID: 3034
Command:top
User: cloud_u+
CPU usage: 0.1%
RAM usage：0.2%
Момент запуска процесса:：15:18
Время выполнения процесса：0:02
Status：S+
VIRT MEM:：275188
Shared MEM:：4488
--------------------------------
strace: Process 3034 attached
strace: Process 3034 detached
saved: 3034-strace.txt
3034-strace.txt.3034: 0.0
('{"1650123900.0": {"events": {}, "calls": {"pselect6": {"total_duration": '
 '4.222843, "count": 2}, "openat": {"total_duration": 0.05795199999999998, '
 '"count": 552}, "fstat": {"total_duration": 0.000154, "count": 4}, "read": '
 '{"total_duration": 0.06094899999999999, "count": 560}, "close": '
 '{"total_duration": 0.05730100000000002, "count": 552}, "lseek": '
 '{"total_duration": 0.0006039999999999999, "count": 12}, "getdents64": '
 '{"total_duration": 0.000969, "count": 4}, "stat": {"total_duration": '
 '0.025973, "count": 274}, "access": {"total_duration": 0.000348, "count": 2}, '
 '"alarm": {"total_duration": 0.0035289999999999996, "count": 48}, '
 '"rt_sigaction": {"total_duration": 0.002287000000000001, "count": 32}, '
 '"fcntl": {"total_duration": 0.0023439999999999997, "count": 32}, "pread64": '
 '{"total_duration": 0.001178, "count": 16}, "write": {"total_duration": '
 '0.000473, "count": 4}}}}')

  ```

## To do:
  Get PID from process name like this:
  ```bash
  PID = $(pidof "${PIDname}" | sed 's/\([0-9]*\)/-p \1/g')
  ```
  
  
