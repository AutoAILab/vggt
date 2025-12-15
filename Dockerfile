# Use a CUDA-enabled base image with Python
FROM nvidia/cuda:12.1.0-devel-ubuntu22.04

# Set the working directory
WORKDIR /app

# Install system dependencies, build tools for C++ components, Python, and bash 
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3.10 \
    python3-pip \
    cmake \
    g++ \
    build-essential \
    libopencv-dev \
    git \
    bash && \
    rm -rf /var/lib/apt/lists/*

# Update to use python3 as default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1

# Upgrade pip tooling so pyproject.toml is parsed correctly
RUN pip install --upgrade pip setuptools wheel


# Copy the requirements file and install Python dependencies
COPY requirements.txt .
COPY requirements_demo.txt .

# Install requirements
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir -r requirements_demo.txt

# Return to the main working directory
WORKDIR /app

