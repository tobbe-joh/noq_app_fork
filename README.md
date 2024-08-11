# noq_app_deployment
Contains files to create docker containers that are ready to be deployed on a server.

## Setting Environment Variables
In order to run the application you need to set environment variables that are listed in the .env.sample file. You can set the variables in .env file (which should never be shared publicly) or by setting the values in your providers environment.

.env file contains values used by the application to access the database, SECRET_KEY for the backend and selection of backend settings.

To use production settings for backend you need to use following value for the DJANGO_SETTINGS_MODULE variable

    DJANGO_SETTINGS_MODULE=noq_django.settings.prod

## Building and Running the Container
To run the application on a server you need to run following commands.

After cloning the repo, run following commands to build the container.

    git submodule init
    git submodule update
    docker compose build

To run the application you need to execute following command.

    docker compose up

## Create superuser for the django admin
To access django admin site you need to create a super user. This can be done with a following command.

    docker compose run --rm backend sh -c "python manage.py createsuperuser"

## Updating Database with noQ Test Data
When you build and run the container for the first time the database is empty. You can use the django admin to add data to the database or run the generate_data script in the backend container.

To update the database with test data run following command.

    docker compose run --rm backend sh -c "python manage.py runscript generate_data"

