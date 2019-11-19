FROM ruby:2.4.0

# Install dependencies:

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential git-core 
      
RUN apt-get update -qq && apt-get install -y build-essential

# generating pdf for html
RUN apt-get install -y wkhtmltopdf

# for postgres
RUN apt-get install -y libpq-dev

# for converting images
RUN apt-get install -y imagemagick

# for paperclip
RUN apt-get install -y file

# for nokogiri
RUN apt-get install -y libxml2 libxml2-dev libxslt1-dev

# for capybara-webkit
RUN apt-get install -y libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs

# for vim
RUN apt-get install -y vim

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

# install up-to date bundler
RUN gem install bundler
RUN bundle install

ADD . $APP_HOME

# COPY config/puma.rb config/puma.rb

EXPOSE 3000

# The default command that gets ran will be to start the Puma server.
CMD bundle exec puma -C config/puma.rb
