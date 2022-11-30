FROM node:alpine
WORKDIR /src
ADD ./backend /src/backend
ADD ./client /src/client
ADD ./app.js /src/app.js
RUN npm install -g npm@9.1.2
RUN cd /src/backend && npm install --silent
CMD ["node", "/src/app.js"]
EXPOSE 3230