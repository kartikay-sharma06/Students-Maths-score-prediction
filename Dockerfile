
FROM python:3.11-slim

WORKDIR /app

# Install Python dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose Flask application port
EXPOSE 5000

# Run Flask using a production WSGI server
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
