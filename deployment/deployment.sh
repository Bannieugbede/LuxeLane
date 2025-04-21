#! /bin/bash

echo "Enter your server username (ex: ubuntu)"
read username
echo "Enter server ip address (ex: 11.111.111.11)"
read ip_address
echo "########### connecting to server... ###########"
echo "${username}"
echo "${ip_address}"
ssh -o StrictHostKeyChecking=no -l "${username}" "${ip_address}" "sudo mkdir -p /var/www/luxelane-laravel;sudo chown -R \$USER:\$USER /var/www; sudo apt install zip unzip";

if [ -d "./luxelane-api" ]; then
  echo 'Zipping luxelane-api folder'
  zip -r ./luxelane-api.zip ./luxelane-api
fi

if [ -d "./deployment" ]; then
  echo 'Zipping deployment folder'
  zip -r ./deployment.zip ./deployment
fi

if [ -f "./luxelane-api.zip" ] && [ -f "./deployment.zip" ]; then
    echo "Enter your luxelane-api.zip file path"
    # read api_source_path
    echo "Uploading luxelane-api.zip to server"
    # scp "${api_source_path}" "${username}@${ip_address}:/var/www/luxelane-laravel"
    scp "./luxelane-api.zip" "${username}@${ip_address}:/var/www/luxelane-laravel"
    echo "uploaded luxelane-api.zip to server"
    ssh -o StrictHostKeyChecking=no -l "${username}" "${ip_address}" "unzip /var/www/luxelane-laravel/luxelane-api.zip -d /var/www/luxelane-laravel";

    echo "Enter your deployment.zip file path"
    # read deployment_source_path
    echo 'Uploading deployment.zip to server...'
    # scp "${deployment_source_path}" "${username}@${ip_address}:/var/www/luxelane-laravel"
    scp "./deployment.zip" "${username}@${ip_address}:/var/www/luxelane-laravel"
    echo 'uploaded deployment.zip to server'
    ssh -o StrictHostKeyChecking=no -l "${username}" "${ip_address}" "unzip /var/www/luxelane-laravel/deployment.zip -d /var/www/luxelane-laravel";
else
  echo "luxelane-api and deployment zip file missing"
fi

echo "installing google zx for further script"
npm i -g zx

echo "Congrats, All the deployment script and api files uploaded to the server."
