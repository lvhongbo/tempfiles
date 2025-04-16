docker run --name data-uploader \
    --network ai_network \
    -e TZ=Asia/Shanghai \
    -v /home/aideploy/pcba-ai/workroot/app_configs/data-uploader/appsettings.json:/app/appsettings.json \
    data-uploader \
    /bin/bash
