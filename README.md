# php-docker by omegacode

## Description
This is a simple docker project to create php based projects.
It is designed do be extendable so I decided to use builds to create the containers. 
This gives you the possibility to modify the images instead of just use them.

## Usage with TYPO3
* clone the git repository:
```bash 
git clone https://github.com/alphajunge/php-docker.git your-project-name
```
* Run `docker-compose up`
* Open your favorite browser and open `http://localhost` or `http://127.0.0.1`.
* Create your index.php under `app/public` or change the vhost configuration to your needs and rebuild the container.
## Database connection details
```ini
Username = user
Password = 1234
Host = db
Port = 3306
Database = application
```
