# Minesweeper App

## Introduction
This is a a simple application that allows users to generate minesweeper boards as well as to view previously generated
minesweeper boards.

## Prerequisites
Requirement environment:
- Ruby and Rails
- Postgres SQL
- Redis
- Docker (optional)

Language and frameworks used in the project:
- Backend Side:
    - Ruby 3.0.0
    - Rails 7.0.6
    - Database: Postgres and Redis
    - Dockerfile and docker-compose to build container
    - Other libraries listed in the Gemfile
- Frontend Side:
    - HTML ERB (Embedded Ruby), CSS, Bootstrap
    - Javascript

## Installation & Configuration
1. Clone project form GIT repo:
> git clone https://github.com/finnpham20/minesweeper_app

2. Configure:

Add the development key credential to run the application.
In folder `config/credentials` add 1 keys below: (I'll attach it)
- `development.key`

3. Install library:

> bundle install --path vendor/bundle

## Database Setup
To set up the database, you need to access the credentials file to configure it.

1. Config database

Edit credential file:
> EDITOR="vim" rails credentials:edit --environment development

Config DB:
```yml
db:
  host: <host db>
  username: <username db>
  password: <password db>
  db_name: <database name>
```

2. Create DB if not exist:

> rails db:create

3. Run migration:

With a new database, you need to run migrations to initialize the structure and tables of the database.

> rails db:migrate

4. Init seed data:

> rails db:seed

## Running the Application:

### Run app in local:
Start funny movies app:
> rails s

The app will be run at url: `http://127.0.0.1:3000/`

## Docker Deployment:

Start app with docker compose

Build:
> docker-compose build

Start app:
> docker-compose up
