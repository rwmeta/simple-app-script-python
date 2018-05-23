FROM python:3.6.2-onbuild
FROM python:3.6.5-alpine

# https://stackoverflow.com/questions/41818226/docker-python-custom-module-not-found
ENV PYTHONPATH /usr/src/app

## Локали и время
#RUN echo 'deb http://ftp.de.debian.org/debian jessie main' > /etc/apt/sources.list
#ENV DEBIAN_FRONTEND noninteractive
#ENV DEBCONF_NONINTERACTIVE_SEEN true
#
#RUN apt-get update -qq && apt-get install -y locales -qq && \
#    echo 'ru_RU.UTF-8 UTF-8' >> /etc/locale.gen && \
#    locale-gen C.UTF-8  en_US.UTF-8 en_us en_US.UTF-8 ru_RU ru_RU.UTF-8 && \
#    dpkg-reconfigure locales && \
#    /usr/sbin/update-locale LANG=C.UTF-8
#
#ENV LANG C.UTF-8
#ENV LANGUAGE C.UTF-8
#ENV LC_ALL C.UTF-8
#
#RUN echo 'Europe/Moscow' > /etc/timezone && dpkg-reconfigure tzdata
## Конец: Локали и время

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app

CMD [ "python", "src/app.py" ]


