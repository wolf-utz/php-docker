ARGS = $(filter-out $@,$(MAKECMDGOALS))
MAKEFLAGS += --silent

typo3-76:
	# bash bin/make/typo3-76.sh $(ARGS)
	docker-compose up -d
	docker cp bin/make/typo3-76.sh app:/typo3-76.sh
	docker exec app /bin/bash -c "cd / && chmod 777 /typo3-76.sh && ./typo3-76.sh"

typo3-87:
	# bash bin/make/typo3-87.sh $(ARGS)
	docker-compose up -d
	docker cp bin/make/typo3-87.sh app:/typo3-87.sh
	docker exec app /bin/bash -c "cd / && chmod 777 /typo3-87.sh && ./typo3-87.sh"