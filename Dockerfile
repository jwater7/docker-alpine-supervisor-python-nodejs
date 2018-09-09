FROM alpine
LABEL maintainer "j"

RUN apk --update --no-cache add python3 py3-setuptools py3-pip curl supervisor tzdata gettext nodejs npm

EXPOSE 9001

COPY supervisor_conf/supervisord-nodaemon.ini /etc/supervisor.d/
COPY supervisor_conf/supervisord-http-server.ini /etc/supervisor.d/

CMD ["supervisord", "-c", "/etc/supervisord.conf"]

