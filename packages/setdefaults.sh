#!/bin/bash

PREFFILE="pref.conf"
echo "#!/bin/bash" > $PREFFILE
echo ""
echo "# Remove the package you are unwilling to run" >> $PREFFILE
echo "pacarr=\"" >> $PREFFILE

for file in `find -name "install_packages_*"`
do
    key=`echo $file | sed -E "s/.*install_packages_(.*).sh/\1/"`
    echo $key >> $PREFFILE
done

echo "\"" >> $PREFFILE
