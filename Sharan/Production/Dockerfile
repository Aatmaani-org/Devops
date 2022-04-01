FROM node:0.10.41
ARG GIT_COMMIT=unspecified
LABEL git_commit=$GIT_COMMIT
COPY ./nodewebsite/express-website /app/
WORKDIR /app/
RUN npm install -g express
RUN npm install -g express-generator
RUN express express-websit
WORKDIR express-website/
RUN npm install
RUN npm install --save nodemailer
EXPOSE 3000
ENTRYPOINT ["npm", "start"]
