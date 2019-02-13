FROM ubuntu:14.04.2

ENV UPDATED_AT 2015-07-08

RUN apt-get update
RUN apt-get install -y \
    ghc \
    libghc-yaml-dev \
    libyaml-perl \
    libyaml-dev \
    python3 \
    python3-yaml \
    ruby \
    php5 \
    php5-dev \
    php-pear \
    curl \
    bash

RUN pecl install yaml-1.3.2
RUN echo 'extension=yaml.so' >> /etc/php5/mods-available/yaml.ini
RUN php5enmod yaml

RUN curl -sSLf https://sh.dflemstr.io/rq | bash -s -- --yes --yes

ADD inputs /app/inputs/
ADD run.sh /app/

ADD yaml2json.hs /app/
ADD yaml2json.pl /app/
ADD yaml2json.py /app/
ADD yaml2json.rb /app/
ADD yaml2json.php /app/
ADD preamble.md /app/

WORKDIR /app

CMD ./run.sh
