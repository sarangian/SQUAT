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
wget https://github.com/ablab/quast/releases/download/quast_5.2.0/quast-5.2.0.tar.gz
tar -xzf quast-5.2.0.tar.gz
mv quast-5.2.0 quast;
rm quast-5.2.0.tar.gz
cp ${INSTDIR}/library/quast_code/* ${INSTDIR}/quast/quast_libs

#build readQdist
echo "build files for generating pre-assembly quality report"
cd ${INSTDIR}/library/preQ
bash ${INSTDIR}/library/preQ/_build.sh
