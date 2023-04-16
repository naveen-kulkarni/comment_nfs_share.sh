#!/bin/bash
DATE_NOW=$(date +"%F")
FILESYSTEM=/etc/vfstab
BACKUP_LOCAL=$FILESYSTEM-$DATE_NOW
BACKUP_CENT=/mnt/team_folders/T5_Migration_plan
HOST=$(hostname)
echo $HOST
##Backupthe /etc/vfstab into /tmp direcotry .
/usr/bin/cp $FILESYSTEM $BACKUP_LOCAL

##Commend the nfs share.
/usr/bin/sed -i '/nfs/s/^/#/' $FILESYSTEM
echo "NFS share are commented"
echo ""


mount n01svmnas1-02:/prd_nfs_itops_unixadmin_01 /mnt

/usr/bin/cp $FILESYSTEM  $BACKUP_CENT/$HOST
echo "For verifying"
cat $FILESYSTEM |grep -i nfs

 

