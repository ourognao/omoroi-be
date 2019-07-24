#!/bin/bash

echo 'Dumping production PostgreSQL databases to localhost...'

heroku pg:backups:capture --app omoroi-be
heroku pg:backups:download --app omoroi-be

echo 'Finished dumping database...'

if [ "$1" == "development" ]; then
  bin/rails db:environment:set RAILS_ENV=development
  rake db:reset
  echo 'Importing production database into development database..'
  pg_restore --verbose --clean --no-acl --no-owner -h localhost -U development -d omoroi_development latest.dump
  echo 'Development importation done..'
  exit 1
fi
