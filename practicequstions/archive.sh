#!/bin/bash
if [ $# -ne 1 ]; then
  echo "Usage: $0 <directory_to_archive>"
  exit 1
fi

directory="$1"
if [ ! -d "$directory" ]; then
  echo "Error: Directory '$directory' not found."
  exit 1
fi
archive_name="${directory}.tar.gz"
tar -czvf "$archive_name" "$directory"
if [ $? -eq 0 ]; then
  echo "Archive '$archive_name' created successfully."
else
  echo "Error: Failed to create archive '$archive_name'."
  exit 1
fi
