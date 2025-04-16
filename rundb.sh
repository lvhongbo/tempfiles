docker run -d \
  --name postgres-ai \
  -e POSTGRES_PASSWORD=6yhnbgt5 \
  -p 5432:5432 \
  -v /home/aideploy/pcba-ai/workroot/postgres_data:/var/lib/postgresql/data \
  postgres