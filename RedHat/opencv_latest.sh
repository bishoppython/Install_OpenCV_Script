sudo yum -y install wget
. `dirname $0`/../baixa_ultima_versao_download_do_arquivo.sh
if [ $? -ne 0 ]; then
	exit $?;
fi
. `dirname $0`/opencv_install.sh
