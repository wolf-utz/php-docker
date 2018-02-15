#!/bin/bash
# Create needed dirs.
mkdir -p app/web
# Download src.
curl -L get.typo3.org/7.6 --output app/typo3_src-7.6.tar.gz
# extract src.
tar -xzf app/typo3_src-7.6.tar.gz -C app/ && mv app/typo3_src*/ app/typo3_src
# Create symlinks

ln -s $(shell pwd)/app/typo3_src 				$(shell pwd)/app/web/typo3_src
ln -s $(shell pwd)/app/web/typo3_src/typo3 		$(shell pwd)/app/web/typo3
ln -s $(shell pwd)/app/web/typo3_src/index.php 	$(shell pwd)/app/web/index.php
ln -s $(shell pwd)/app/web/typo3_src/_.htaccess $(shell pwd)/app/web/.htaccess
# Create first install file.
touch app/web/FIRST_INSTALL