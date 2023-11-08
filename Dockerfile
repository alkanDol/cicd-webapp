FROM node:18

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY wait-for-it.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wait-for-it.sh

COPY . .

EXPOSE 3000

CMD ["wait-for-it.sh", "database:27017", "--", "yarn", "start"]
