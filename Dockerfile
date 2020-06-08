FROM debian:stable-slim

RUN apt-get update \
    && apt-get install -y dnsmasq \
    && mkdir /etc/dnsmasq \
    && echo "conf-dir=/etc/dnsmasq,*.conf" > /etc/dnsmasq.conf

ENV ip_dnsmaster 8.8.8.8
ENV hosttointercept trailers.apple.com
# ENV ip_pms

ADD ./files/dnsmasq_launcher.sh /
ADD ./files/*.conf /etc/dnsmasq/

EXPOSE 53/tcp 53/udp

CMD ["/bin/bash", "/dnsmasq_launcher.sh"]
