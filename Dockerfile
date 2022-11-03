FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential nodejs
RUN mkdir /app
WORKDIR /app
# install nodejs(LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_14.x \
  | bash - && apt-get install -y nodejs
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
