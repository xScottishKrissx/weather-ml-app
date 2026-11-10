# Use a lightweight Python 3.9 image as the foundation.
FROM python:3.9-slim

# Set /app as the working directory inside the container.
WORKDIR /app

# Copy the dependency list into the container.
COPY requirements.txt .

# Install Python dependencies without storing the pip download cache.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application, HTML templates and trained model into the container.
COPY . .

# Document that the Flask application listens on port 5000.
EXPOSE 5000

# Start the Flask application when the container runs.
CMD ["python", "app.py"]

