FROM ruby:2.7-alpine
RUN mkdir -p /app & \
    apk add git