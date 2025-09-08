# Use Python 3.11 slim image
FROM python:3.11-slim

# Set proxy environment variables for build and runtime
ENV http_proxy=http://proxy-se.ddc.teliasonera.net:8080
ENV https_proxy=http://proxy-se.ddc.teliasonera.net:8080
ENV no_proxy="127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,.teliasonera.net,.telia.net,.telia.io,.teliacompany.io,.teliacompany.net,.teliacompany.com,.telia.se,.estpak.ee"

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app/*.py ./app/

# Create non-root user for security
RUN useradd --create-home --shell /bin/bash appuser && \
    chown -R appuser:appuser /app
USER appuser

# Expose port - customize this for your service
EXPOSE {{SERVICE_PORT}}

# Set environment variables
ENV PYTHONPATH=/app
ENV PYTHONUNBUFFERED=1
ENV FASTMCP_LOG_LEVEL=debug

# Run the application - customize the command for your service
CMD ["fastmcp", "run", "app/main.py", "--transport", "http", "--host", "0.0.0.0", "--port", "{{SERVICE_PORT}}"]