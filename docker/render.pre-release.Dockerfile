# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Build the frontend
RUN apt-get update && apt-get install -y nodejs npm
WORKDIR /app/frontend
RUN npm install
RUN npm run build

# Move the build files to the expected location
WORKDIR /app
RUN mkdir -p /app/static
RUN cp -r /app/frontend/build/* /app/static/

# Expose the port the app runs on
EXPOSE 8000

# Run the application
CMD ["python", "-m", "langflow", "run"]

