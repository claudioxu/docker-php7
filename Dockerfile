FROM ubuntu:latest

RUN apt-get -y update
RUN apt-get -y install software-properties-common
RUN locale-gen en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN add-apt-repository ppa:ondrej/php
RUN apt-get -y update
RUN apt-get -y mcrypt
RUN apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-common php7.0-gd php7.0-mysql php7.0-mcrypt php7.0-curl php7.0-intl php7.0-xsl php7.0-mbstring php7.0-zip php7.0-bcmath php7.0-iconv --allow-unauthenticated
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisord.conf

RUN a2enmod rewrite
RUN a2enmod headers

EXPOSE 80
EXPOSE 443

CMD ["/usr/bin/supervisord"]
