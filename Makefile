ARGS = $(filter-out $@,$(MAKECMDGOALS))
MAKEFLAGS += --silent

typo3-76:
	docker-compose up -d --build
	docker cp bin/make/typo3-76.sh app:/typo3.sh
	docker exec app /bin/bash -c "cd / && chmod 777 /typo3.sh && ./typo3.sh"

typo3-87:
	docker cp bin/make/typo3-87.sh app:/typo3.sh
	docker exec app /bin/bash -c "cd / && chmod 777 /typo3.sh && ./typo3.sh"