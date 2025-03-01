# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Run setup.sh to install other necessary tools
RUN chmod +x setup.sh && ./setup.sh

# Define environment variable
ENV NAME AutoSecAI-Plus

# Run AutoSecAI-Plus.sh when the container launches
CMD ["./AutoSecAI-Plus.sh"]