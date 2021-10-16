# Place instructions here

FROM ubuntu:latest
ENV DEBIAN_FRONTEND=nonintercative 

#update and install packages
RUN apt update
RUN apt install -y vim
RUN apt install -y apache2

#enable the UserDir module
RUN a2enmod userdir

#enable DirectoryIndex module
RUN a2enmod autoindex 

#adding yourself as a user
ENV USER jcc65664
RUN adduser $USER
RUN usermod -aG sudo $USER

# Set the working directory to public_html                                   
WORKDIR /home/jcc65664/public_html

# Copy the index.html file into the dir               
COPY index.html .                               
RUN mv index.html jazminc.html

# Add in other directives as needed
LABEL Maintainer: "jazmin.celestino.694@my.csun.edu"

EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
