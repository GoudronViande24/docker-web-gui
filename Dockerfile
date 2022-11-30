FROM node:alpine

# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

# Install make and other common packages
RUN apk add --no-cache bash git openssh make cmake

WORKDIR /src
ADD ./backend /src/backend
ADD ./client /src/client
ADD ./app.js /src/app.js
RUN npm install -g npm@latest
RUN cd /src/backend && npm install
CMD ["node", "/src/app.js"]
EXPOSE 3230