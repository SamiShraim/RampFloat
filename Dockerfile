# Use an official GCC image from Docker Hub as the base image
FROM gcc:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app