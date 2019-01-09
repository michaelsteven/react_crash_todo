# stage: 1 - build
FROM node:11.6.0-stretch-slim as react-build
WORKDIR /app
COPY . ./
RUN yarn
RUN yarn build


# stage: 2 - the runtime
FROM nginx:alpine
COPY --from=react-build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
