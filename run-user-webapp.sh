docker run -d \
    --name user-webapp \
    -p 8080:8080  \
    -v /home/aideploy/pcba-ai/workroot/app_configs/user-webapp/appsettings.json:/app/appsettings.json \
    user-webapp
