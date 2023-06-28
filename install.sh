#!/bin/bash
set -e

INSTDIR="$( cd "$(dirname "$0")" ; pwd)"

cd ${INSTDIR}
chmod 764 squat.sh

if [ -d quast ]; then
	rm -r quast
fi


#install quast
echo "install quast"
cd ${INSTDIR}
wget https://downloads.sourceforge.net/project/quast/quast-4.6.3.tar.gz
tar -xzf quast-4.6.3.tar.gz
mv quast-4.6.3 quast;
rm quast-4.6.3.tar.gz*
cp ${INSTDIR}/library/quast_code/* ${INSTDIR}/quast/quast_libs

#build readQdist
echo "build files for generating pre-assembly quality report"
cd ${INSTDIR}/library/preQ
bash ${INSTDIR}/library/preQ/_build.sh
