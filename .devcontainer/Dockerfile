# Base image: Microsoft Dev Containers Python 3.13 (used by GitHub Codespaces)
FROM mcr.microsoft.com/devcontainers/python:3.13-bullseye

# OCI labels for GitHub Container Registry
LABEL org.opencontainers.image.source=https://github.com/zoltanctoth/ceu-ai-engineering-class
LABEL org.opencontainers.image.description="CEU AI Engineering Class Development Container"

# Install AWS CLI v2 (do this early as it rarely changes)
RUN ARCH=$(uname -m) && \
    cd /tmp && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-${ARCH}.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

    
# Switch to vscode user for UV installation
USER vscode

# Install UV package manager
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Add UV to PATH
ENV PATH="/home/vscode/.local/bin:$PATH"

WORKDIR /workspaces/ceu-ai-engineering-class

# Copy project files for dependency installation
COPY --chown=vscode:vscode pyproject.toml uv.lock .python-version ./

# Create virtual environment and install dependencies using UV
RUN uv sync --frozen
