# noq_app_deployment
Contains files to create docker containers that are ready to be deployed

## Building the Container
Before you deploy the docker images and container you need to take following steps.

After cloning the repo, run following commands to build the container.

    git submodule init
    git submodule update
    docker compose build

## Running the Container
To run the container you need to create .env file with parameters for the database. You can use .env.sample as a template for the .env file.

After that you can run the container.
    docker compose up

## Updating Database with noQ Test Data
To update the database with test data run following command.
    docker compose run --rm backend sh -c "python manage.py runscript generate_data"

