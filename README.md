# php-docker by omegacode

## Description
This is a simple docker project to create php based projects.
It is designed do be extendable so I decided to use builds to create the containers. 
This gives you the possibility to modify the images instead of just use them.

### Easy installable frameworks
* TYPO3 (7.6 and 8.7 LTS)

## Requirements
* make
* docker
* docker compose

## Usage with TYPO3
* clone the git repository:
```bash 
git clone https://bitbucket.org/omegac0de/php-docker.git your-project-name
```
* open the newly created folder with your favorite ide/editor.
* use  make to create a new TYPO3 project:
```bash 
make install typo3-87-composer
```
* wait for the message "Your Application is ready!"
* open your favorite browser and open `http://localhost` or `http://127.0.0.1`.
* Follow the TYPO3 install instructions. When it comes to database connection configuration, use the following configuration:
```txt
Username: user
Password: 1234
Host:     database
Port:     3306
Database: application
```
