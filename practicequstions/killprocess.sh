#!/bin/bash
if [ $# -ne 1 ]; then
  echo "Usage: $0 <process_name>"
  exit 1
fi
process_name="$1"
pkill -9 "$process_name"
if [ $? -eq 0 ]; then
  echo "Process '$process_name' forcefully terminated."
else
  echo "No process named '$process_name' found or an error occurred."
fi
