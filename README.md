# simple-api-rails #
Simple API Rails using Ruby as Programming Language (Rails Framework), PostgreSQL as Database

### Requirements
Simple API is currently extended with the following requirements. Instructions on how to use them in your own application are linked below.

| Requirement | Version    |
| ----------- | ---------- |
| Ruby        | >= 2.7.1   |
| Rails       | >= 6.0.2.2 |
| PosgtreSQL  | >= 12.0    |

### Setup
* Setup Ruby <https://www.ruby-lang.org/en/>
* Setup Rails <https://rubyonrails.org/>
* Setup PostgreSQL <https://www.postgresql.org/>

### Installation
Make sure you the requirements above already install on your system. Or you could easily run with Docker to make your environment clean.

Clone the project to your directory and install the dependencies.
```sh
$ git clone git@github.com:moemoe89/simple-api-rails.git
$ cd simple-api-rails
$ bundle install
```

Setup your environments.
```sh
$ cp .env.example .env
```
Change your PostgreSQL credentials depends on your PostgreSQL installed config.
```sh
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=simple_api
DB_USERNAME=postgres
DB_PASSWORD=postgres

SECRET_KEY_BASE=xxxxx
```

### Migrate
Setup your migration following by this command.
```sh
$ rails db:migrate
```

### Seed
Seed your data following by this command.
```sh
$ rails db:seed
```

### Run Application
For run application:
```sh
$ rails s
```

Verify the apllication by navigating to your server address in your preferred browser.

```sh
127.0.0.1:3000
```

### Docker
Simple API is very easy to install and deploy in a Docker container. Simply use the docker-compose build to build the image.

```sh
$ docker-compose build
```
Once done, run the Docker image by using docker-compose up command.

```sh
$ docker-compose up -d
```

Setup the DB migration by using docker-compose exec command.
```sh
$ docker-compose exec app rails db:migrate
```

Setup the DB seed by using docker-compose exec command.
```sh
$ docker-compose exec app rails db:seed
```

Verify the application by navigating to your server address in your preferred browser.

```sh
127.0.0.1:3000
```

Stop application could be done with docker-compose stop command.
```sh
$ docker-compose stop
```

License
----

MIT