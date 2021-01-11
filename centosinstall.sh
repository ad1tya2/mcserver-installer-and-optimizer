#!/bin/bash
echo Installing requirements!
{yum install python3 -y
yum install zip -y
yum install git -y
pip install clint
pip install requests
} &> /dev/null
git clone https://github.com/ad1tya2/mcserver-installer-and-optimizer.git
mv ./mcserver-installer-and-optimizer/* ./
rm -r mcserver-installer-and-optimizer
chmod +x mcinstaller.sh
echo -e "Should the minecraft server downloader-optimizer be started Now? (y/n)\n"
read opt
if [ "$opt" == "y" ] || [ "$opt" == "Y" ]
then
	echo Starting!
	./mcinstaller.sh
fi
