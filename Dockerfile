FROM node:latest AS Builder

WORKDIR /app

COPY . .

RUN npm install

FROM Builder AS Runtime

EXPOSE 3000

CMD ["npm", "start", "--", "--watch"]