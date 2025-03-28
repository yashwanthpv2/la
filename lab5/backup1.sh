#!/bin/bash

mkdir -p /tmp/backup
echo "Backup folder created at /tmp/backup"
cp ~/*.c ~/*.py /tmp/backup 2>/dev/null
echo "Copied all C and Python files to /tmp/backup"
cd /tmp || exit
echo "Navigated to /tmp"
TAR_FILE="backup-$(date +%Y-%m-%d).tar.gz"
tar -czf $TAR_FILE backup
echo "Compressed the backup folder into $TAR_FILE"
udisksctl mount -b /dev/sdb1 
echo "Mounted the pendrive"
mv $TAR_FILE /media/RVU/pendrive/
echo "Moved $TAR_FILE to /media/RVU/pendrive/"
udisksctl unmount -b /dev/sdb1
echo "Unmounted the pendrive"
rm -rf /tmp/backup
echo "Deleted the backup folder"
echo "Backup and transfer process completed successfully."
