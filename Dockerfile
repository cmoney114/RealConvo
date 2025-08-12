FROM python:3.11-alpine

# Make sure pip is up-to-date
RUN pip install --no-cache-dir --upgrade pip

# Set working directory
WORKDIR /app

# Copy requirements first for build caching
COPY requirements.txt .

# Install only runtime deps
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY . .

# No CMD here — Smithery uses smithery.yaml startCommand
