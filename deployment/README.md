# Automation scripts for luxelane Laravel

#### At first login your server from terminal

```bash
ssh SERVER_USERNAME@SERVERIP
```

#### Upload api and deployment project to Virtual Server form your PC - RUN on Local PC
To upload the zipped `luxelane-api` and `deployment` files to server you need to run the below command form your luxelane project root
> while running below command you will asked for enter your server `username` and `ip address` by entering and a successful connection you will also asked for enter your `luxelane-api.zip` and `deployment.zip`
> files path and the path will be look like `/home/your_project_folder_path/luxelane-laravel/luxelane-api.zip` for pixer-api.zip file so forth for `deployment.zip`

```bash
    bash deployment/deployment.sh
````

Then login your server using `ssh` and,

#### Server Environment setup script - RUN on Virtual Server

```bash
    bash /var/www/luxelane-laravel/deployment/nodesetup.sh
````

#### Nginx Setup And Settings - RUN on Virtual Server

```bash
    zx /var/www/luxelane-laravel/deployment/setenv.mjs
````

#### Backend build - RUN on Virtual Server

```bash
    sudo zx /var/www/luxelane-laravel/deployment/backendbuildscript.mjs
```

#### Frontend build script - RUN on Local PC
Run the below command from your luxelane project root

```bash
    zx deployment/frontendbuildscript.mjs
```

#### Frontend run script - RUN on Virtual Server

```bash
    zx /var/www/luxelane-laravel/deployment/frontendrunscript.mjs
```
