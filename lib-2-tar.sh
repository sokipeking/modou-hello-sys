#!/bin/sh

the_user=0

cd buildroot-2014.05/output/
cp ../../dist/init.sh target/

chown -R $the_user target
chgrp -R $the_user target

tar jcvf target.tar.bz2 target/

mv target.tar.bz2 ../../dist/
cd ../../



