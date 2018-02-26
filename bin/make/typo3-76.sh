#!/bin/bash

echo "TYPO3 installation is starting! Plaese wait until the proccess is over."
# Create needed dirs.
mkdir -p app/web
# Download src.
echo "Downloading TYPO3..."
curl -L get.typo3.org/7.6 --output app/typo3_src-7.6.tar.gz
# extract src.
echo "Extracting TYPO3..."
tar -xzf app/typo3_src-7.6.tar.gz -C app/
# Create symlinks
echo "Create symlinks..."
cd /app/web
ln -s ../typo3_src*/ typo3_src
ln -s typo3_src/typo3 typo3
ln -s typo3_src/index.php index.php
ln -s typo3_src/_.htaccess .htaccess
# Create first install file.
touch FIRST_INSTALL
echo "Your Application is ready!"
