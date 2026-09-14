# JellyfinCronScripts
Some scripts that can be run to make changes in Jellyfin without the need for plugins
Make sure you run a "chmod +x {file}" on the file to make the script executable once you download.

You can run the script a couple ways.
If you run through docker, 2 ways I would is:
1. mount an external "scripts" folder to your docker container in read-only and leave these scripts in there so you can run them inside the container
2. run this through a docker exec command if you want to avoid having these scripts available in the Jellyfin container

I made these to work with a cron-job so they don't keep writing again and again causing issues after the first run. I run these with ofelia with tags on Jellyfin on my system but this isn't required, just a suggestion.

**Scripts and Their Uses**
1. **changeName.sh**
  - This script can be run to change the name and website title in Jellyfin from "Jellyfin" to whatever you set the variable "NewName" to. I made this because methods to change the name through plugins always causes 2 issues for me. 1 being there's always that second delay where the "Jellyfin" name would flash before it changes to what i wanted my page to be named & 2. if you were to add the webpage as a web-app on mobile then the changed name would never apply. This way fixes both of those problems. Be mindful to keep the quotes so you don't run into errors
2.  **MediaBar_MakD.sh**
  - This can be run to insert MakD's MediaBar plugin. I made this because I upgraded to Jellyfin V12 and the plugin that I was using, from IAmParadox, wasn't updated yet. So this is a good workaround for that without needing to wait for that update.
