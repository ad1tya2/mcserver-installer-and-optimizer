@echo off
DEL .\workdir /Q
DEL .\generatedfiles /Q
rmdir .\workdir
mkdir .\workdir
mkdir .\generatedfiles
py start.py
(
copy .\files\bukkit.yml .\workdir\
copy .\files\spigot.yml .\workdir\
copy .\files\server.properties .\workdir\
copy .\files\eula.txt .\workdir\
copy .\files\paper.yml .\workdir\
copy .\files\run.bat .\workdir\
) > nul
set /p port=Port of the minecraft server?
echo server-port=%port%>>.\workdir\server.properties
set /p ram=How much ram do you want For eg-3G or 3000M?
echo java -Xms%ram% -Xmx%ram% -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper.jar nogui>>.\workdir\run.bat
echo pause>>.\workdir\run.bat
echo Storing your files to the generatedfiles directory inside this folder!
echo Just double click the bat file to run the server!
echo Next time you run this program the generatedfiles will be deleted! So store it somewhere safe!
move workdir\* generatedfiles\* > nul
pause
