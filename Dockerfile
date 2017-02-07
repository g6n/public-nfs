FROM alpine:latest

RUN apk update \
	&& apk add nfs-utils \
	&& rm -rf /var/cache/apk/*

VOLUME /media/storage
EXPOSE 111/udp 111/tcp 2049 /udp 2049/tcp 32765/udp 32766/udp 32767/udp
ADD start-nfs.sh /start-nfs.sh
ADD nfs /etc/conf.d/nfs
RUN chmod +x /start-nfs.sh
CMD [ "/start-nfs.sh" ]
