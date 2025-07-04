# rstudio_compose

Docker image for rstudio. It allows the creation of several users, each with its own docker volume for persistence.

## Before starting!

The following steps should be followed:

- Rename ```users.env.example``` to ```users.env```
- In ```users.env```, remove the entry 'user' and add your own. Add also the corresponding USER_user_PASSWORD, and modify the rstudio password
- In ```docker-compose.yml```, in volumes define the volume for your new user. Also add the volume in the last section of the file
- That's all. To start the service, do

```docker compose up```

The service should start at http://localhost:8787
