ARGS = $(filter-out $@,$(MAKECMDGOALS))
MAKEFLAGS += --silent

typo3-76:
	# bash bin/make/typo3-76.sh $(ARGS)
	docker-compose up -d
	docker cp bin/make/typo3-76.sh php:/typo3-76.sh
	docker exec php /bin/bash -c "cd / && chmod 777 /typo3-76.sh && ./typo3-76.sh"