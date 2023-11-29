#!/usr/bin/env sh

set -x

# use default nginx.conf unless SSL or NOSSL are set to 1

if [ "$POD_NAMESPACE" != "" ]; then
	sed -i.bak "s/default.svc.cluster.local/$POD_NAMESPACE.svc.cluster.local/" /etc/nginx/nginx.conf
fi

nginx -g 'daemon off;'
