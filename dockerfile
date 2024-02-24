# Stage 1: Build stage
FROM openjdk:11 AS builder
LABEL maintainer="Your Name <your.email@example.com>"
LABEL description="Docker image for building a Hello World Java program"

# Set working directory
WORKDIR /app

# Copy the Java source code into the container
COPY calculator.java /app

# Compile the Java source code
RUN javac calculator.java

# Stage 2: Final stage
FROM openjdk:11-jre-slim

# Set metadata labels
LABEL maintainer="SE441"
LABEL description="Docker image for running a calculator Java program"

# Set working directory
WORKDIR /app

# Copy the compiled Java class file from the builder stage
COPY --from=builder /app/calculator.class /app

# Define the command to run the Java application
CMD ["java", "calculator"]
