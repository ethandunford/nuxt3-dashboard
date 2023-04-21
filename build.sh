
echo "==> 🔨 building project..."
DOCKER_BUILDKIT=1 docker build -t node17 .
echo "lets build the UI"
docker run --rm \
    -v "$(pwd)":/home/node/app \
    -w /home/node/app \
    node17 \
    bash -c "npm install && npm run generate"