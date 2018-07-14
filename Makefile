MAKEFLAGS += --silent
run: install typo3-87

install: down
	if [ -d app ]; then rm -rf app; fi
	if [ -d .database ]; then rm -rf .database; fi
	docker-compose up -d --build

# Framework installers
typo3-87-composer: install
	docker cp bin/make/typo3-87-composer.json app:/var/www/html/composer.json
	docker exec app /bin/bash -c "composer install"
	docker exec app /bin/bash -c "touch web/FIRST_INSTALL"
	echo "Your Application is ready! Open https://127.0.0.1 to access!"

typo3-87: install
	docker cp bin/make/typo3-87.sh app:/typo3.sh
	docker exec app /bin/bash -c "cd / && chmod 777 /typo3.sh && ./typo3.sh"

typo3-76: install
	docker cp bin/make/typo3-76.sh app:/typo3.sh
	docker exec app /bin/bash -c "cd / && chmod 777 /typo3.sh && ./typo3.sh"

# Docker commands
bash-app:
	docker-compose up -d
	docker-compose exec app bash

build:
	docker-compose build
	docker-compose up -d

up:
	docker-compose up -d

down:
	docker-compose down