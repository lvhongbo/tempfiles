docker run -d \
    --name data-server \
    -e TZ=Asia/Shanghai \
    -p 8090:8080  \
    -v /home/aideploy/pcba-ai/workroot/app_configs/data-server/appsettings.json:/app/appsettings.json \
    data-server
