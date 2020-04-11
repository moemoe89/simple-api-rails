FROM ruby:2.7.1-slim

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev libxslt-dev libxslt1-dev libxml2-dev patch ruby-dev zlib1g-dev liblzma-dev libtool libffi-dev nodejs

RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

ENV DB_HOST postgres
ENV DB_PORT 5432
ENV DB_DATABASE simple_api
ENV DB_USERNAME docker
ENV DB_PASSWORD docker
ENV RAILS_ENV production

COPY . /myapp

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server"]