#!/usr/bin/env bash
set -ex
if [ -z "$Z_GITHUB_TOKEN" ]; then
    echo "Error: Z_GITHUB_TOKEN environment variable is not set, execute `onepass` first?" >&2
    exit 1
fi
echo $Z_GITHUB_TOKEN | docker login ghcr.io -u zoltanctoth --password-stdin
docker buildx build --platform linux/amd64,linux/arm64 -t ghcr.io/zoltanctoth/ai-engineering-class:latest-release . --push

