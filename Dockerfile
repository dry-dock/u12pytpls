FROM drydock/u12pls:prod

ADD . /u12pytpls

RUN /u12pytpls/install.sh
