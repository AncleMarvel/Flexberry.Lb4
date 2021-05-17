FROM node:10 as ember_app

COPY /src/ember-app /src/ember-app

RUN \
  set -x; \
  cd /src/ember-app/; \
  yarn global add ember-cli@3.1.4; \
  yarn global add bower;

RUN \
  set -x; \
  cd /src/ember-app/; \
  yarn install ; \
  bower install  --allow-root;

RUN \
  set -x; \
  cd /src/ember-app/; \
  ember build --environment=docker

FROM mono:latest as backend

COPY /src/Lb4 /src/Lb4

RUN \
 cd /src/Lb4 ;\
 nuget restore Lb4.sln; \
 msbuild /p:Configuration=Release Lb4.sln

FROM flexberry/alt.p8-apache2-mono:latest

MAINTAINER mail@flexberry.net

COPY --from=backend /src/Lb4/ODataBackend /var/www/vhosts/project/
COPY --from=ember_app /src/ember-app/dist /var/www/vhosts/project
COPY /src/Docker/vhosts.conf /conf
