#!/bin/bash
echo Installing requirements!
{sudo apt install python3 zip openjdk-8-jre-headless -y
pip3 install clint requests
} &> /dev/null
git clone https://github.com/ad1tya2/mcserver-installer-and-optimizer.git
mv ./mcserver-installer-and-optimizer/* ./
rm -r mcserver-installer-and-optimizer
chmod +x mcinstaller.sh
sed -i -e 's/\r$//' mcinstaller.sh
echo -e "Should the minecraft server downloader-optimizer be started Now? (y/n)\n"
read opt
if [ "$opt" == "y" ] || [ "$opt" == "Y" ]
then
	echo Starting!
	./mcinstaller.sh
fi
