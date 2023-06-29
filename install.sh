#!/bin/bash
set -e

INSTDIR="$( cd "$(dirname "$0")" ; pwd)"

cd ${INSTDIR}
chmod 764 squat.sh

if [ -d bwa ]; then
	rm -r bwa
fi

if [ -d quast ]; then
	rm -r quast
fi

#install bwa
echo "install bwa-0.7.15"
wget https://downloads.sourceforge.net/project/bio-bwa/bwa-0.7.15.tar.bz2
tar jxvf bwa-0.7.15.tar.bz2
rm bwa-0.7.15.tar.bz2*
mv bwa-0.7.15 bwa
cd bwa; make

#install quast
echo "install quast"
cd ${INSTDIR}
git clone https://github.com/ablab/quast.git
cd quast
chmod 755 install.sh
./install.sh

#build readQdist
echo "build files for generating pre-assembly quality report"
cd ${INSTDIR}/library/preQ
bash ${INSTDIR}/library/preQ/_build.sh
