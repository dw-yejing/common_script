source /etc/profile
#kill tomcat pid 
pidlist=`ps -ef|grep data-admin.jar |grep -v "grep"|grep -v "prod1"|awk '{print $2}'`
if [ "$pidlist" = "" ]
then
echo "no tomcat pid alive!" 
else
echo "tomcat pid list :  $pidlist" 
echo "killing pidlist :  $pidlist" 
kill -9 $pidlist
echo "data-admin.jar stopped successfully!"  
sleep 5
fi
cd /home/dms/service

nohup java -jar ./data-admin.jar --spring.profiles.active=prod3  -XX:+OmitStackTraceInFastThrow &
echo "now starting data-admin.jar......"
