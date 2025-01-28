FROM qdrant/qdrant:v1.8.0-gpu-nvidia

# Copy config from adjacent config/ directory
COPY config/config.yaml /qdrant/config/config.yaml

# For AMD GPUs (uncomment if needed):
# RUN apt-get update && apt-get install -y \
#     vulkan-tools \
#     mesa-vulkan-drivers \
#     && rm -rf /var/lib/apt/lists/*