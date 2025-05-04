#!/bin/bash

# Install Docker and Docker Compose
apt-get update -y
apt-get install -y ca-certificates curl gnupg lsb-release
mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update -y
chmod a+r /etc/apt/keyrings/docker.gpg
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Create Dockerfile
cat << 'EOF' > Dockerfile
FROM ghcr.io/chroma-core/chroma:0.4.2

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir numpy==1.21.6 pandas==1.3.5
EOF

# Create docker-compose.yaml
cat << EOF > docker-compose.yaml
version: '3.9'

networks:
  net:
    driver: bridge
services:
  server:
    build: .
    volumes:
      - index_data:/chroma/.chroma/index
    ports:
      - 8000:8000
    networks:
      - net

volumes:
  index_data:
    driver: local
  backups:
    driver: local

EOF

# Build and run the Docker container
docker compose up -d --build
