#!/bin/bash

source_dir="/home/matthias/Dokumente"
backup_dir="/home/matthias/Backup"
timestamp=$(date +%d%m%Y%H%M)
backup_file="backup_$timestamp.tar.gz"

tar -czvf "$backup_dir/$backup_file" "$source_dir"
