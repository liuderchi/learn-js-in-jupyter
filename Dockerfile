FROM mhart/alpine-node:latest AS build-env

ENV PROJ_ROOT learn-js-in-jupyter

WORKDIR /$PROJ_ROOT
ADD notebooks /$PROJ_ROOT
RUN ["/bin/sh", "build.sh"]


FROM alpine
LABEL maintainer="TE-CHI LIU"

ENV PROJ_ROOT learn-js-in-jupyter
ENV JUPYTERLAB_SETTINGS_FOLDER jupyterlab-settings

COPY --from=build-env /$PROJ_ROOT /home/$PROJ_ROOT
ADD $JUPYTERLAB_SETTINGS_FOLDER /home/$JUPYTERLAB_SETTINGS_FOLDER
WORKDIR /home/$PROJ_ROOT
