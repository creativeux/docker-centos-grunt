 FROM creativeux/centos:7.0.1406

MAINTAINER Aaron Stone <aaronastone@gmail.com>

# Install the EPEL repository
RUN yum -y install \
  epel-release

# Install nodejs and npm
RUN yum -y install \
  nodejs \
  npm

# Install grunt and bower to run the webapp builds and development serving
RUN npm install -g -y grunt-cli \
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