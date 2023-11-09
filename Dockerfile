# Use an Alpine Linux base image
FROM alpine:latest

# Install vsftpd FTP server and create a user
RUN apk --no-cache add vsftpd && \
    adduser -D -h /home/ftpuser -s /bin/false ftpuser && \
    echo "ftpuser:password" | chpasswd

# Copy your vsftpd configuration file to the container
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

# Expose the FTP port
EXPOSE 21

# Start vsftpd when the container runs
CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
