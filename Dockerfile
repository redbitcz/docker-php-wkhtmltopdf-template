FROM php:7.4-apache-buster

LABEL maintainer="Jakub Bouček <jakub.boucek@redbit.cz>"
LABEL org.label-schema.name="PHP (Apache module), Debian Buster"
LABEL org.label-schema.vcs-url="https://github.com/redbitcz/docker-php-wkhtmltopdf-template"

# Workdir during installation
WORKDIR /tmp

# Copy fonts
COPY fonts/ /usr/share/fonts/
COPY fontconf/ /etc/fonts/conf.d/

WORKDIR /tmp

RUN DEBIAN_FRONTEND=noninteractive \
    echo "deb http://http.debian.net/debian/ buster main contrib non-free" > /etc/apt/sources.list && \
    echo "deb http://http.debian.net/debian/ buster-updates main contrib non-free" >> /etc/apt/sources.list && \
    echo "deb http://security.debian.org/ buster/updates main contrib non-free" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
    openssl \
    build-essential \
    curl \
    xz-utils \
    ca-certificates \
    xfonts-100dpi \
    xfonts-75dpi \
    xfonts-base \
    fonts-roboto \
    fonts-inconsolata \
    ttf-mscorefonts-installer \
    fontconfig \
    xorg \
    libjpeg62-turbo && \
    curl -L https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_amd64.deb -o wkhtmltox_0.12.6-1.buster_amd64.deb && \
    dpkg -i wkhtmltox_0.12.6-1.buster_amd64.deb && \
    fc-cache -f -v && \
    apt-get purge -y curl && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*  && \
    a2enmod rewrite expires

WORKDIR /var/www/html
