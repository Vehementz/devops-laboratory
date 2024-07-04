# WordPress Docker Project

This project sets up a WordPress environment using Docker, including a separate MySQL database service. The setup includes custom Dockerfiles for both WordPress and MySQL to allow for easy customization and scalability.

## Project Structure

Here’s a brief overview of the project directory structure:

```
.
├── compose.yml # Docker Compose file to orchestrate Docker containers
├── config # Configuration files and Dockerfile for MySQL
│ └── Dockerfile
├── db_password.txt # (Optional) Database password file
├── db_root_password.txt # (Optional) Database root password file
├── secrets.txt # (Optional) Secrets for secure storage (not actively used)
└── src # Source files and Dockerfile for WordPress
├── app # WordPress plugins and themes
└── Dockerfile
```


## Requirements

- Docker
- Docker Compose
- (Optional) `.env` file for setting environment variables

## Setup Instructions

### 1. Environment Configuration

Create a `.env` file in the project root variables, with values that you choose :
Note a template .env-copy exist 

```
MYSQL_ROOT_PASSWORD=
MYSQL_DATABASE=
MYSQL_USER=
MYSQL_PASSWORD=
WORDPRESS_DB_HOST=
WORDPRESS_DB_USER=
WORDPRESS_DB_PASSWORD=
WORDPRESS_DB_NAME=
```

Use `docker compose up --build`

Go the the port 98. And you can access your wordpress application