#!/bin/bash
# Simple File Manager Script
echo "=== DevOps Playground File Manager ==="
echo "1. Create file"
echo "2. Delete file"
echo "3. Archive folder"
echo "3.5. Backup file"
echo "4. Exit"
read -p "Choose option: " option

case $option in
    1)
        read -p "Enter filename: " fname
        touch "$fname"
        echo "File $fname created."
        ;;
    2)
        read -p "Enter filename to delete: " fname
        rm -f "$fname"
        echo "File $fname deleted."
        ;;
    3)
        read -p "Enter folder name to archive: " folder
        if [ -d "$folder" ]; then
            tar -czvf "${folder}.tar.gz" "$folder"
            echo "Folder $folder archived."
        else
            echo "Folder not found!"
        fi
        ;;
    3.5)
        read -p "Enter file to backup: " fname
        if [ -f "$fname" ]; then
            cp "$fname" "backup_$(date +%Y%m%d_%H%M%S)_$fname"
            echo "Backup created."
        else
            echo "File not found!"
        fi
        ;;

    4)
        echo "Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid option!"
        ;;
esac
