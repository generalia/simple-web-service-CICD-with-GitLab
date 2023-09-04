# Use an Alpine-based Go image as the base image
FROM golang:1.16-alpine

# Set the working directory in the container
WORKDIR /go/src/app

# Copy the Go application code to the container
COPY . .

# Build the Go application
RUN go build -o main .

# Expose port 8080 for the Go application
EXPOSE 8080

# Start the Go application at /mygo
CMD ["./main"]