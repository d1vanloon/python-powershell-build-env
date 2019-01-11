FROM python:3.6.5

ENV PATH="/root/.poetry/bin:${PATH}"

RUN apt-get update && \
    # Install system components
    apt-get install -y curl gnupg apt-transport-https && \
    # Import the public repository GPG keys
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    # Register the Microsoft Product feed
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list' && \
    # Update the list of products
    apt-get update && \
    # Install PowerShell
    apt-get install -y powershell && \
    # Install poetry
    curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python && \
    poetry config settings.virtualenvs.in-project true
