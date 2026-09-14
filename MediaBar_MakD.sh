#!/bin/sh
if grep -q 'Jellyfin-Media-Bar' /usr/share/jellyfin/web/index.html; then
    echo "Jellyfin-Media-Bar inserted already ; index.html not modified" #>&2
#elif grep -q 'slideshowpure' /usr/share/jellyfin/web/index.html; then
#    echo "slideshowpure inserted already ; index.html not modified" #>&2
elif grep -q 'Jellyfin Slideshow' /usr/share/jellyfin/web/index.html; then
    echo "Jellyfin Slideshow inserted already ; index.html not modified" #>&2
else
    sed -i 's|</head>|<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/MakD/Jellyfin-Media-Bar@latest/slideshowpure.css" /><script async src="https://cdn.jsdelivr.net/gh/MakD/Jellyfin-Media-Bar@latest/slideshowpure.js"></script></head>|g' /usr/share/jellyfin/web/index.html
    if [ $? -ne 0 ]; then
        echo "Error: index.html not modified" #>&2
        #exit 1
    else
        echo "index.html modified"
    fi
fi

#exec "$@"
