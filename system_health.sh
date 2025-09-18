#!/bin/bash

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

LOGFILE="system_health.log"

echo "System Health Check" | tee -a $LOGFILE
date | tee -a $LOGFILE

# CPU check
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU_USAGE=${CPU_USAGE%.*}  # remove decimals
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
  echo "High CPU usage: $CPU_USAGE%" | tee -a $LOGFILE
else
  echo "CPU usage: $CPU_USAGE%" | tee -a $LOGFILE
fi

# Memory check
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
MEM_USAGE=${MEM_USAGE%.*}
if [ "$MEM_USAGE" -gt "$MEM_THRESHOLD" ]; then
  echo "High Memory usage: $MEM_USAGE%" | tee -a $LOGFILE
else
  echo "Memory usage: $MEM_USAGE%" | tee -a $LOGFILE
fi

# Disk check
DISK_USAGE=$(df / | grep / | awk '{ print $5}' | sed 's/%//')
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
  echo "Low Disk Space: $DISK_USAGE% used" | tee -a $LOGFILE
else
  echo "Disk usage: $DISK_USAGE%" | tee -a $LOGFILE
fi

# Running processes
PROC_COUNT=$(ps -e --no-headers | wc -l)
echo "Running processes: $PROC_COUNT" | tee -a $LOGFILE
