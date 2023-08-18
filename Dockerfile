FROM ruby:3.0.0

RUN mkdir -p /usr/src/app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev redis-server nano cron
RUN rm -rf /etc/localtime
RUN ln -s /usr/share/zoneinfo/America/New_York /etc/localtime

WORKDIR /usr/src/app

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
ARG RAILS_MASTER_KEY=${RAILS_MASTER_KEY}
ENV RAILS_MASTER_KEY=${RAILS_MASTER_KEY}

RUN gem install bundler:2.3.22

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN bundle install

COPY . /usr/src/app

# to prevent rake issue
RUN echo 'IRB.conf[:USE_AUTOCOMPLETE] = false' > ~/.irbrc

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
