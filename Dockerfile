#The base image for the container 
FROM python:3 AS base
# Install base libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3-pip \
        python3-venv \
        libglib2.0-dev \
    && apt-get clean
# Keeps Python from generating .pyc files in the container 
ENV PYTHONDONTWRITEBYTECODE=1 
# Turns off buffering for easier container logging 
ENV PYTHONUNBUFFERED=1 



#
# Development Dependencies Stage
#
FROM base AS devdeps
# Install dev tools
RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        python3-dev \
    && apt-get clean 



#
# VS Code Stage 
# (This is preferred to run as a Docker Dev Environment)
#
FROM devdeps AS development
# Modifyble through cli args
ARG WORKDIR=/com.docker.devenvironments.code
ARG USER="vscode"
# Create and change user
RUN useradd -s /bin/bash -m $USER \
    && groupadd docker \
    && usermod -aG docker $USER
USER $USER
# Add bin directories to PATH
RUN echo 'export PATH="$HOME/.local/bin:$HOME/bin:$DOCKERDEVENVDIRECTORY/env/bin:$PATH"' >> /home/$MYUSERNAME/.bashrc
# Keep the container alive
CMD ["sleep", "infinity"]



#
# Production Target Stage 
# Normally called without specifying "target" in compose
#
#FROM base as runtime
# Get python modules
#RUN make create_env && make install
# Start the app right away
#CMD ["make", "run"]