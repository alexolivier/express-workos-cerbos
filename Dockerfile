FROM node:14 AS build-env
ADD . /app
WORKDIR /app
RUN npm install --production

FROM gcr.io/distroless/nodejs:14
COPY --from=build-env /app /app
WORKDIR /app
CMD ["index.js"]