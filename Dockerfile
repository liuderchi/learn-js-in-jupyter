FROM mhart/alpine-node:latest AS build-env

ENV PROJ_ROOT learn-js-in-jupyter

WORKDIR /$PROJ_ROOT
ADD notebooks /$PROJ_ROOT
RUN ["/bin/sh", "build.sh"]


FROM liuderchi/jupyterlab-ijavascript:latest
LABEL maintainer="TE-CHI LIU"

ENV HOME /root
ENV SERVER_PORT 8888
ENV PROJ_ROOT learn-js-in-jupyter

COPY --from=build-env /$PROJ_ROOT $HOME/$PROJ_ROOT
ADD jupyterlab-settings $HOME/.jupyter/lab/user-settings/@jupyterlab
WORKDIR $HOME/$PROJ_ROOT

CMD jupyter lab --ip=* --port=$SERVER_PORT --no-browser --notebook-dir=$HOME --allow-root
