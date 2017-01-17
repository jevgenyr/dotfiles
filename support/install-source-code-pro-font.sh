#!/bin/bash
mkdir /tmp/adobefont
pushd /tmp/adobefont
wget https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip
unzip 1.017R.zip
mkdir -p ~/.fonts
cp source-code-pro-1.017R/OTF/*.otf ~/.fonts/
fc-cache -f -v
popd
rm -rf /tmp/adobefont
