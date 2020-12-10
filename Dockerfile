FROM node:12-alpine AS Base

RUN mkdir -p /docs

WORKDIR /usr/local/app

COPY ./scripts/docker-entrypoint.sh /usr/local/bin
COPY . .

RUN ln -s /usr/local/bin/docker-entrypoint.sh .
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

FROM Base AS Installer

RUN npm i -g pm2 --silent && npm ci

FROM Installer AS Runner

RUN npm run build

EXPOSE 8000

ENTRYPOINT [ "sh", "/usr/local/bin/docker-entrypoint.sh" ]

CMD [ "run-prod" ]