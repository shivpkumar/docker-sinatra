# The base repository to build this image on
# top of. Using a ruby library out of
# laziness. The alternative is to use `base`
# or `ubuntu` and manually install ruby.
#
FROM ruby:2.1.5

ENV PORT 3000
ENV APP_DIR /app/

# Move all source code to image
#
COPY Gemfile \
  config.ru \
  app.rb \
  $APP_DIR

# Set the working directory. All statements
# after this are executed from this directory.
#
WORKDIR $APP_DIR

# Install application dependencies.
#
RUN bundle

# Expose port to the outside world.
# Note: This doesn't make the container
# visible to the host yet. The container
# needs to be run with the `-p` flag to
# do that.
#
# Example:
# `docker run -p 3000:3000 docker-test`
#
EXPOSE $PORT

# Specify the default command for the
# container, which in this case is
# starting a web server on the exposed
# port.
#
CMD rackup -p $PORT
