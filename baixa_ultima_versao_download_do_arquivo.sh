# Bishop Andersons
# 2017-09-30
# Procura a ultima versão e faz download do arquivo pela pagina do sourceforge.e

version="$(wget -q -O - http://sourceforge.net/projects/opencvlibrary/files/opencv-unix | egrep -o '\"[0-9](\.[0-9]+)+(-[-a-zA-Z0-9]+)?' | cut -c2- |sort -V -r -u |head -1)"
downloadfilelist="opencv-$version.tar.gz opencv-$version.zip"
downloadfile=
for file in $downloadfilelist;
do
        wget --spider http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/$version/$file/download
        if [ $? -eq 0 ]; then
                downloadfile=$file
        fi
done
if [ -z "$downloadfile" ]; then
        echo "Could not find download file on sourceforge page.  Please find the download file for version $version at"
        echo "http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/$version/ and update this script"
        exit  1
fi
