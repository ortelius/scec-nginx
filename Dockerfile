FROM nginx:alpine@sha256:d68d230c2c7f0b28c7e5f17ed66d521deeba23aa467568202af72f7f7f61cd94
EXPOSE 80

WORKDIR /etc/nginx/

RUN mkdir /etc/nginx/location; \
    mkdir /var/www;
RUN apk update; \
    apk upgrade

COPY nginx.conf  /etc/nginx/
COPY location/ /etc/nginx/location/
COPY entrypoint.sh /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]
