
FROM python:3.11-slim

WORKDIR /app

# Install Python dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Render provides PORT at runtime; 10000 is its default for web services.
EXPOSE 10000

# Run Flask using a production WSGI server
CMD ["sh", "-c", "gunicorn --bind 0.0.0.0:${PORT:-10000} application:app"]
