#!/bin/bash
rm -r ./workdir
mkdir ./workdir
python3 start.py
echo "Do you want use optimized configs? (y/n)"
read opt 
if [ "$opt" == "y" ] || [ "$opt" == "Y" ]
then
	echo "Copying optimized files!"
	cp ./files/bukkit.yml ./workdir/
	cp ./files/spigot.yml ./workdir/
	cp ./files/paper.yml ./workdir/
	cp ./files/server.properties ./workdir/
else
	echo "Not copying optimized Defaults!"
	cp ./files/serverpropertiesunoptimized.txt ./workdir/server.properties
fi
echo -e "Which port do you want to run the server on?\n Press [enter] to use default 25565"
read kk
if ["$kk" = ""]; then 
	echo 'server-port=25565' >>./workdir/server.properties
	echo "Using default port!"
else 
	echo 'server-port=$kk' >>./workdir/server.properties
fi
echo "Do you want a auto optimized startup script for your server? (y/n)"
read asd
if [ "$asd" = "y" ] || [ "$asd" = "Y" ]; then
	cp ./files/start.sh ./workdir/
	chmod +x ./workdir/start.sh
	echo -e "What do you want to name your server?(For your convenience only!)"
	read servername
	echo -e "How much ram do you want to alloechoe to your server,\n For eg: 5G or 5000M"
	read ram 
	echo -e "To use the startup script cd into your minecraft directory and Just enter ./start.sh \n Your server will be started automatically, \n After this to access your server console type screen -r $servername"
	echo "screen -d -m -S '$servername' java -Xms$ram -Xmx$ram -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper.jar nogui" >>./workdir/start.sh
else
	echo ""
fi
	
echo -e "Where do you want to store the files? If your folder does not exist it will be created automatically! Please enter the directory \n Or Just press enter to save it as a zip in the downloads section of the folder"
read xyz
if [ "$xyz" = "" ]; then
	echo -e "Your server files will be saved in a zip!\n Please enter the name of the zip file you want!"
    read name
	echo "storing files to $name"
	zip -r ./zips/$name ./workdir/*
else
	echo "storing the files to $xyz"
	mkdir $xyz
	mv ./workdir/* $xyz
fi
echo -e "Done! Please reccomend my github repository to others also! And follow Me!\nMade By - ad1tya2"
