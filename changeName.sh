#!/bin/sh
NewName="Jellyfin"
FileLocation="/usr/share/jellyfin/web/index.html"
if grep -q '<title>Jellyfin</title>' ${FileLocation}; then
    sed -i "s|<title>Jellyfin</title>|<title>${NewName}</title>|g" ${FileLocation} && sed -i 's|content='"Jellyfin"'>|content='"${NewName}"'>|g' ${FileLocation}
    if [ $? -ne 0 ]; then
        echo "Error: ${FileLocation} not modified" #>&2
        #exit 1
    else
        echo "${FileLocation} modified > ${NewName} inserted"
    fi
else
    echo "${NewName} inserted already ; ${FileLocation} not modified" #>&2
    #exit 0
fi

manifest_doc=$(grep -oP '<link[^>]*rel="manifest"[^>]*href="[^"]*"' ${FileLocation} | grep -oP '(?<=href=")[^"]*')
if [ $? -ne 0 ]; then
    echo "Error: could not find manifest file" #>&2
    #exit 1
else
    if grep -q 'Jellyfin' /usr/share/jellyfin/web/${manifest_doc}; then
        sed -i 's/Jellyfin/'"${NewName}"'/g' /usr/share/jellyfin/web/${manifest_doc} && echo "${manifest_doc} modified successfully > ${NewName} inserted" && exit 0
    else
        echo "${NewName} inserted already ; ${manifest_doc} not modified" #>&2
    fi
fi

#exec "$@"
