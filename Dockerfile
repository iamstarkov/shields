FROM node:8.9.4-alpine

RUN apk add --no-cache gettext imagemagick librsvg ttf-dejavu git
ENV FALLBACK_FONT_PATH /usr/share/fonts/ttf-dejavu/DejaVuSans.ttf

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app/
RUN npm install --production

CMD NODE_ENV=production NODE_TLS_REJECT_UNAUTHORIZED=0 node server

EXPOSE 80
