FROM golang:1.14

WORKDIR /go/src

ENV AYAME_VER '2020.1.2'
RUN wget -O - "https://github.com/OpenAyame/ayame/archive/${AYAME_VER}.tar.gz" | tar zxvf - &&\
    mv "ayame-${AYAME_VER}" ayame &&\
    cd ayame &&\
    make &&\
    make init &&\
    mkdir /var/log/ayame

WORKDIR /go/src/ayame
COPY ./ayame.yml ./ayame.yaml

CMD ["./ayame"]
