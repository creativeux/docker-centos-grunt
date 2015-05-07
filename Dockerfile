FROM creativeux/centos-base:7.0.1406

MAINTAINER Aaron Stone <aaronastone@gmail.com>

# Install the EPEL repository
RUN yum -y install \
  epel-release \
  tar \
  bzip2 \
  make \
  gcc

# Install the base node & npm modules
RUN yum -y install \
  nodejs \
  npm

# Upgrade node to 0.12.0
RUN npm cache clean -f
RUN npm install -g n
RUN n 0.12.0

# Upgrade npm to latest
RUN npm install -g npm@latest

# Install Grunt and Bower
RUN npm install -g \
  grunt-cli \
  bower

# Clean yum
RUN yum clean all

# Create a static file serve folder
RUN mkdir /var/www

# Execute the commands in the file serve folder
WORKDIR /var/www

# Open port 9000 for app, 35729 for livereload, and 22 for SSH
EXPOSE 9000 35729 22

# Expose our web root and log directories log.
VOLUME ["/vagrant", "/var/www", "/var/log", "/var/run"]