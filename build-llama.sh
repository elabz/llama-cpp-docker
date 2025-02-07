#!/bin/bash
echo "Run this file in the llama.cpp official repo root"
echo "Building llama.cpp CUDA server image..."

docker build \
    --build-arg CUDA_VERSION=12.4 \
    --build-arg CUDA_DOCKER_ARCH="52;61;70;75" \
    -t local/llama.cpp:server-cuda \
    --target server \
    -f .devops/cuda.Dockerfile \
    .

echo "Build complete!"