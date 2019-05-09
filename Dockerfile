FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN mkdir -p /app
WORKDIR /app

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5 --without development test

# Set Rails to run in production
ENV RAILS_ENV production
ENV RACK_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

# Copy the main application.
COPY . ./

# Precompile Rails assets
RUN rails assets:precompile

# Create the database
RUN rails db:migrate

EXPOSE 3000
CMD ["rails", "server", "-e", "production", "-b", "0.0.0.0"]