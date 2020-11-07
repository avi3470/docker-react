# Specify a base image
FROM  node:alpine

WORKDIR /usr/app

# Install some depenendencies
COPY ./package.json ./
RUN npm config set strict-ssl false
RUN npm install
COPY ./ ./ 

RUN npm run build


FROM nginx
COPY --from=0 /usr/app/build /usr/share/nginx/html
