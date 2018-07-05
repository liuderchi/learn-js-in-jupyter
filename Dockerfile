FROM alpine
LABEL maintainer="TE-CHI LIU"

ENV HOME /home

ADD . $HOME/learn-js-in-jupyter
WORKDIR $HOME/learn-js-in-jupyter
