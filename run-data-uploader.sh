docker run --name data-uploader \
    -it \
    --network ai_network \
    -e TZ=Asia/Shanghai \
    -v /home/aideploy/pcba-ai/workroot/app_configs/data-uploader/appsettings.json:/app/appsettings.json \
    -v /home/aideploy/pcba-ai/data:/data \
    data-uploader \
    /bin/bash
