# Base image
FROM ubuntu:20.04

# Install prerequisites
RUN apt-get update && apt-get install -y fortune-mod cowsay dos2unix

# Set work directory inside the container
WORKDIR /app

# Copy the script to the container
COPY wisecow.sh /app/wisecow.sh

# Convert Windows line endings to Unix line endings
RUN dos2unix /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Expose the port (default is 4499, as mentioned in the repo)
EXPOSE 4499

# Command to run the application
CMD ["bash", "/app/wisecow.sh"]
