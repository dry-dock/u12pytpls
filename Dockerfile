FROM drydock/u12pyt:prod

ADD . /tmp

RUN /tmp/install.sh && rm -rf /tmp
