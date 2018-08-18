FROM mhart/alpine-node:latest AS build-env

ENV PROJ_ROOT learn-js-in-jupyter

WORKDIR /$PROJ_ROOT
ADD notebooks /$PROJ_ROOT
RUN ["/bin/sh", "build.sh"]


FROM alpine
LABEL maintainer="TE-CHI LIU"

ENV PROJ_ROOT learn-js-in-jupyter

COPY --from=build-env /$PROJ_ROOT /home/$PROJ_ROOT
# TODO copy jupyterlab-config/notebookConfig.json
WORKDIR /home/$PROJ_ROOT
