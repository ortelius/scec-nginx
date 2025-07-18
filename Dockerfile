FROM nginx:alpine@sha256:d67ea0d64d518b1bb04acde3b00f722ac3e9764b3209a9b0a98924ba35e4b779
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
