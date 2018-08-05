FROM mhart/alpine-node:latest AS build-env

ENV PROJ_ROOT learn-js-in-jupyter
ENV PROJ1 Get_Started
ENV PROJ2 playground
ENV PROJ3 Promise
ENV PROJ4 ES6_Misc

RUN npm config set package-lock false
WORKDIR /$PROJ_ROOT

ADD ./$PROJ1 ./$PROJ1
ADD ./$PROJ2 ./$PROJ2
RUN cd ./$PROJ2 && npm i && cd ..
ADD ./$PROJ3 ./$PROJ3
RUN cd ./$PROJ3 && npm i && cd ..
ADD ./$PROJ4 ./$PROJ4
RUN cd ./$PROJ4 && npm i && cd ..


FROM alpine
LABEL maintainer="TE-CHI LIU"

ENV PROJ_ROOT learn-js-in-jupyter

COPY --from=build-env /$PROJ_ROOT /home/$PROJ_ROOT
WORKDIR /home/$PROJ_ROOT
