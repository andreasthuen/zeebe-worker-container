
# Please check https://hub.docker.com/_/microsoft-dotnet-core-aspnet/ for latest
# version of the dotnet image available.
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base


# Default behaviour is to use settings from appsettings.mock.json unless
# environment is overrided.
ENV DOTNET_ENVIRONMENT Mock

RUN sed 's/DEFAULT@SECLEVEL=2/DEFAULT@SECLEVEL=1/' /etc/ssl/openssl.cnf > /etc/ssl/openssl.cnf.changed && mv /etc/ssl/openssl.cnf.changed /etc/ssl/openssl.cnf

RUN apt-get update
RUN apt-get install libc6

