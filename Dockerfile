FROM node:22-alpine

# define environment variables
ENV HOME=/home/node/app
ENV NODE_ENV=production

# create application folder and assign rights to the node user
RUN mkdir -p $HOME && chown -R node:node $HOME

# set the working directory
WORKDIR $HOME

# set the active user
USER node

# copy package.json from the host
COPY --chown=node:node package.json $HOME/

# install application modules
RUN npm install && npm cache clean --force

# copy remaining files
COPY --chown=node:node . .

EXPOSE 8080
EXPOSE 3000

CMD [ "npm", "run", "start" ]