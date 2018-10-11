# PowerShell on Raspberry Pi
#
# Version 1.0

FROM raspbian/stretch

LABEL maintainer="Ken.Lasko@gmail.com"

ENV  DEBIAN_FRONTEND noninteractive

RUN apt-get update
# Install libraries necessary for PowerShell
RUN apt-get install --no-install-recommends -y libunwind8 libicu57 libcurl4-openssl-dev cron
# Get the latest released PS module
RUN wget https://github.com/PowerShell/PowerShell/releases/download/v6.0.4/powershell-6.0.4-linux-arm32.tar.gz
# Make PowerShell directory and install PS module
RUN mkdir ~/powershell && tar -xvf ./powershell-6.0.4-linux-arm32.tar.gz -C ~/powershell && sudo ln -s ~/powershell/pwsh /usr/bin/pwsh && sudo ln -s ~/powershell/pwsh /usr/local/bin/powershell
# Remove install files after completion
RUN rm -rf /var/lib/apt/lists && rm powershell-6.0.4-linux-arm32.tar.gz
# Install PS modules (Azure auth and DNS modules shown as examples)
#RUN ~/powershell/pwsh -Command Install-Module -Name AzureRM.Profile.Netcore -Force && ~/powershell/pwsh -Command Install-Module -Name AzureRM.Dns.Netcore -Force
