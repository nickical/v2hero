FROM alpine:latest

ENV CONFIG_JSON1=none CONFIG_JSON2=none UUID=996aff87-45d7-4d17-91a7-b5dccca803e6 CONFIG_JSON3=none CERT_PEM=none KEY_PEM=none VER=4.18

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && mkdir -m 777 /v2raybin \ 
 && cd /v2raybin \
 && curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v4.18.0/v2ray-linux-64.zip \
 && unzip v2ray.zip \
 && chmod +x /v2raybin/v2ray 
 && rm -rf v2ray.zip 
 && chgrp -R 0 /v2raybin 
 && chmod -R g+rwX /v2raybin
 
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh 

#ENTRYPOINT /entrypoint.sh

CMD /entrypoint.sh



