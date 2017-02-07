FROM alpine:latest

RUN apk update \
	&& apk add nfs-utils \
	&& rm -rf /var/cache/apk/*

VOLUME /media/storage
EXPOSE 111/udp 2049/tcp
ADD start-nfs.sh /start-nfs.sh
CMD [ "/start-nfs.sh" ]
