# README

# Find My Pet

## Project Description

Find my Pet is a web application which enables pet owners
to report missing pets, and the public to report missing pet sightings,
with the intention of reuniting missing pets with their owners.

## Setup Instructions

```
rails db:create db:migrate db:seed

bundle

rails s
```

## Keys required
```
ENV["email_user_name"] = "..."
ENV["email_password"]  = "..."
ENV['TWITTER_CONSUMER_KEY'] = "..."
ENV['TWITTER_CONSUMER_SECRET'] = "..."

ENV['FACEBOOK_APP_ID'] = "..."
ENV['FACEBOOK_APP_SECRET'] = "..."

ENV['aws_access_key_id'] = "..."
ENV['aws_access_secret'] = "..."
```

View the live version of the application here: [Find My Pet](https://findmypetapp2.herokuapp.com/)

### List Of Contributors

*TBA*
