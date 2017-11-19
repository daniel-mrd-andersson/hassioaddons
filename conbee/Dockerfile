ARG BUILD_FROM
FROM $BUILD_FROM

# Add env
ENV LANG C.UTF-8

# EXPOSE 80 8080 

# Change to the edge repositories as this is needed for the qt5-websockets packages to be installed (qt5 deps need to be same version)

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main > /etc/apk/repositories
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories


# Install all needed packages and download the qt5-websockets from testing

RUN apk update
RUN apk add qt
RUN apk add qt5-qtbase 
RUN apk add libc6-compat 
RUN apk add curl 
RUN apk add qt5-qtserialport 
RUN apk add mesa-gles 
RUN apk add binutils 
RUN apk add qt5-qtbase-x11
ADD  http://dl-cdn.alpinelinux.org/alpine/edge/testing/armhf/qt5-websockets-5.9.1-r0.apk /tmp
RUN apk add /tmp/qt5-websockets-5.9.1-r0.apk

# Download deconz packages

RUN wget http://www.dresden-elektronik.de/rpi/gcfflasher/gcfflasher-latest.deb
RUN wget http://www.dresden-elektronik.de/rpi/deconz/beta/deconz-2.04.89-qt5.deb


# Need to manually extract files as Alpine uses APK and are not able to install Debian packages

RUN ar xv gcfflasher-latest.deb
RUN tar xv -C / -f data.tar.gz
RUN ar xv deconz-2.04.89-qt5.deb
RUN tar xv -C / -f data.tar.xz

# Clean up som data

RUN rm -rf gcfflasher-latest.deb
RUN rm -rf deconz-2.04.89-qt5.deb
RUN rm -rf data.tar.gz
RUN rm -rf data.tar.xz
RUN rm -rf debian-binary
RUN rm -rf control.tar.gz

# Remove refernce to desktop part of applications

RUN mv ./usr/share/applications/deCONZ.desktop ./usr/share/applications/deCONZ.desktop.old
RUN ln -s /data /root/.local

# Ensure that configuration data is written outside the docker container


# Start deCONZ assigning both HTTP and WS port
#
#RUN /usr/bin/deCONZ -platform minimal --http-port=80 --ws-port=8080

# Copy data
COPY run.sh /

RUN chmod a+x /run.sh

ENTRYPOINT [ "/run.sh" ]

#docker run -p 80:80 -t -i --privileged -v /dev/bus/usb:/dev/bus/usb ubuntu bash 
#touch /root/.local/share/data/dresden-elektronik/deCONZ/session.default
#docker run -v /etc/timezone:/etc/timezone -v /dev/serial0:/dev/serial0 -p 80:80 -p 8080:8080 --privileged -v /dev/bus/usb:/dev/bus/usb daniel/base 
#"/dev/serial0"
