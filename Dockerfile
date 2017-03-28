FROM ruby:2.3.3-alpine

# Dependencias
RUN apk update && \
    apk add git build-base libxml2 libxslt

WORKDIR /srv/indexador

ENV BUNDLE_JOBS 4
COPY Gemfile* ./
RUN bundle install --deployment --without development test
COPY . /srv/indexador/

RUN RAILS_ENV=development bundle exec rake assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
