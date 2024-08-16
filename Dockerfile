FROM nginx:alpine@sha256:c04c18adc2a407740a397c8407c011fc6c90026a9b65cceddef7ae5484360158
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
