# docker-alpine-laravel-5.8

Docker setup for developing laravel applications. It should work with Laravel 5 applications, tested with 5.8.

## Install Requirements

Install git, docker and composer then install laravel with composer.
1. Install Git
2. [Install Docker](https://docs.docker.com/install/)
3. [Install Composer](https://getcomposer.org/download/) or copy paste the following code (unix only)
```bash
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
```
4. [Install laravel with composer](https://laravel.com/docs/5.8/installation#installing-laravel)
```bash
composer global require laravel/installer
```

## Creating the project folder with docker

Clone this docker ready laravel environment.
```bash
git clone https://github.com/zebnat/docker-alpine-laravel-5.8.git my-project-folder
```

Create a fresh laravel project in the same folder.
```bash
cd my-project-folder
```
```bash
laravel new
```

Create a `.docker.env` file from the example
```bash
cp .docker.env.example .docker.env
```

Fill `.docker.env` variables as you wish

Edit laravel `.env` file and make the host `mysql` (the same name as the mysql service, see docker-compose.yml)
```
DB_HOST=mysql
```

Finally, set `DB_DATABASE DB_USERNAME DB_PASSWORD` in the laravel `.env` file, use the ones you put in `.docker.env`

## Running docker-compose

```bash
docker-compose up
```
*Wait a while for the database to be ready*

## Check your browser

Allright! Navigate to `http://localhost:8010` you can change the port if you want, just check `docker-compose.yml`

## Using artisan commands

We will run artisan commands on the php container. While in the root project folder, just run.
```bash
# docker-compose exec SERVICE_NAME COMMAND ...ARGS
docker-compose exec php php artisan migrate
```
The container workdir is `/app/` so the command will execute in the laravel root folder.

## Notes

The database data will persist unless you run `docker-compose down -v`. If you don't want persistence remove the volumes from mysql in the `docker-compose.yml` file.

(___WARNING___) Remember to add `.docker.env` to the `.gitignore` that laravel created.


## Disclaimer

I'm no Docker expert. I'm still learning. This workflow works for me very well but it may not work for you. If you follow the instructions there should be no issues. Feel free to create a github issue if you find any problem.

