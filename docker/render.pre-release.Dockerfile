FROM langflowai/langflow:1.0-alpha

# Install dependencies if any
# RUN pip install -r requirements.txt

# Expose the port
EXPOSE 8000

# Start the application
CMD ["python", "-m", "langflow", "run"]
