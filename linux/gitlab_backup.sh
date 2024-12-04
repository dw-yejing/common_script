current_date=$(date +"%Y_%m_%d")
backup_dir="/home/docker/app/gitlab/backup"
logfile="/home/docker/app/gitlab/backup.log"
echo "log $(date '+%Y-%m-%d %H:%M:%S')" >> $logfile
docker exec -t gitlab gitlab-backup create &&
echo "local backup complete" >> $logfile
file=`ls $backup_dir |grep "$current_date"|awk '{print $1}'| head -n 1 `
if [ "$file" = "" ]; then
  echo "not found backup file" >> $logfile
  exit 1
fi
scp $backup_dir/$file root@127.0.0.1:/root/gitlab_backup &&
echo "backup file[$file]  has been transferred" >> $logfile
