FROM nginx:alpine@sha256:65645c7bb6a0661892a8b03b89d0743208a18dd2f3f17a54ef4b76fb8e2f2a10
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
