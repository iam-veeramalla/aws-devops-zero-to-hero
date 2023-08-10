# Use the official Python image as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the Python dependencies file to the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Flask application code to the container
COPY app.py .

# Expose the port the Flask application will run on
EXPOSE 3000

# Command to run the Flask application when the container starts
CMD ["python", "app.py"]
