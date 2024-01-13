FROM ubuntu:20.04

# Install required dependencies
RUN apt-get update && \
    apt-get install -y wget

# Download and install aaPanel
RUN wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && \
    bash install.sh

# Set working directory
WORKDIR /www/

# Display credentials and region selection during build
ARG AA_PANEL_USERNAME
ARG AA_PANEL_PASSWORD
ARG AA_PANEL_EMAIL
ARG AA_PANEL_REGION="India"

RUN echo "AA Panel Credentials:" && \
    echo "Username: $AA_PANEL_USERNAME" && \
    echo "Password: $AA_PANEL_PASSWORD" && \
    echo "Email: $AA_PANEL_EMAIL" && \
    echo "Region: $AA_PANEL_REGION"

# Expose necessary ports
EXPOSE 888 80 21 443 7800

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# CMD to keep the container running (modify as needed)
CMD ["tail", "-f", "/dev/null"]
