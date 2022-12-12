FROM ruby:3.0.0-alpine

RUN apk upgrade && apk update
RUN apk add \
    build-base \
    postgresql-dev \
    tzdata

COPY Gemfile* .
RUN bundle install

COPY . .

EXPOSE 3000

ENTRYPOINT ["rails", "server", "-b", "0.0.0.0"]
