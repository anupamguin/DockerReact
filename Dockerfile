FROM node:16-alpine as builder
# As builder means from this line to below lines are in build phase and the purpose of this phase 
# to install dependencies and build our application.

WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /app/build  /usr/share/nginx/html
# above line means -> copy over something from that other phase that we were just working on to /html