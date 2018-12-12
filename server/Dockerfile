FROM node

WORKDIR /usr/app

COPY package.json yarn.lock ./

RUN npm install -g yarn
RUN yarn

COPY . .

EXPOSE 8000

CMD ["yarn", "start"]