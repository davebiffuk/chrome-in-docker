FROM debian
MAINTAINER Dave Holland <dave@biff.org.uk>
ADD https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb /src/google-chrome-stable_current_amd64.deb
RUN apt-get update && apt-get install -qqy \
    ca-certificates \
    gconf-service \
    hicolor-icon-theme \
    libappindicator1 \
    libasound2 \
    libcanberra-gtk-module \
    libcurl3 \
    libexif-dev \
    libgconf-2-4 \
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    libnspr4 \
    libnss3 \
    libpango1.0-0 \
    libv4l-0 \
    libxss1 \
    libxtst6 \
    wget \
    xdg-utils \
    --no-install-recommends && \
    dpkg -i '/src/google-chrome-stable_current_amd64.deb'
RUN mkdir /data
ENV DISPLAY :0
ENTRYPOINT [ "/usr/bin/google-chrome-stable" ]
CMD [ "--user-data-dir=/data" ]
