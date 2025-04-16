docker run -d \
    --name data-uploader \
    -e TZ=Asia/Shanghai \
    -v /home/aideploy/pcba-ai/workroot/app_configs/data-uploader/appsettings.json:/app/appsettings.json \
    data-uploader
