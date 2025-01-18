 # Use the official lightweight Python image
FROM python:3.12-slim


# Set the working directory
WORKDIR /app

# # Download latest listing of available packages:
RUN apt-get -y update
# # Upgrade already installed packages:
RUN apt-get -y upgrade
# Install a new package:
RUN apt-get -y install syslog-ng vim net-tools iputils-ping 
RUN apt-get -y install logrotate cron supervisor procps

# Define environment variable
ENV APP_ROOT_PATH="/app"
ENV APP_ROOT_HOST="${APP_ROOT_PATH}/host"
ENV TMP_RESOURCE_PATH="${APP_ROOT_PATH}/resources"
# will be created from the run script 
ENV APPLOGS="${APP_ROOT_HOST}/logs"
ENV SUPERVISOR_LOGS="${APPLOGS}/supervisord"
ENV RESOURCE_PATH="${APP_ROOT_HOST}/resources"
ENV APP_PR_FILES="${APP_ROOT_HOST}/pr"

# Create a new directory under /app
RUN mkdir -p ${APP_ROOT_HOST}
RUN mkdir -p ${TMP_RESOURCE_PATH}
RUN mkdir -p ${SUPERVISOR_LOGS}

# Install any needed packages specified in requirements.txt
# If you don't have any additional packages, you can skip this step
RUN pip install --no-cache-dir  pyaml==24.12.1 
