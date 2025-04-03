#!/bin/bash
if ! command -v udisksctl &> /dev/null; then
  echo "Error: udisksctl not found. Please install it."
  exit 1
fi
udisksctl mount -l
if [ $? -ne 0 ]; then
  echo "Error: udisksctl command failed."
  exit 1
fi
