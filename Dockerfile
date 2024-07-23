FROM nginx:alpine@sha256:fbb400a7f82655026d277472e27b1668fcdec84eaf4d0045f3bf86e0092826b3
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
