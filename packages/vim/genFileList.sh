#!/bin/bash

dirs=$*
if [ "$dirs" == "" ]; then
  echo No Arguments
  exit 255
fi
echo $dirs

find $dirs -type f -name '*' -follow | sed -e 's#^./##' > FileList.tmp
if [ -z FileList ]; then
  count_old=`cat FileList |wc -l`
else
  count_old=0
fi

cat FileList.tmp                                                        | \
    egrep '\.(c|cc|cpp|h|hh|hpp|i|inc|inl|l|ll|lpp|y|yy|ypp|gp|pl|tcl)$'| \
    egrep -v '_(lexer|parser|kwds|msg|message)\.(cc|hh)$'               | \
    egrep -v '_(lexer|parser|kwds|msg|message)\.(cpp|hpp)$'             | \
    egrep -vw '(2rdparty|temp|Debug|Release|workspace)'                 | \
    egrep -vw '(exanic|exasock|release)'                                | \
    sort -fu > FileList

rm -rf FileList.tmp

count_new=`cat FileList | wc -l`

if [ $count_new -ne 0 ]; then
  echo "$count_new file(s) found."

  echo "Updating cscope ..."
  cscope -k -p2 -b -i FileList

  echo "Updating ctags ..."
  #ctags -d -t -T -w `cat FileList` #>& /dev/null
  #ctags `cat FileList` #>& /dev/null
  ctags -R --c++-kinds=+p --fields=+iaS --extra=+q `cat FileList` 2> /dev/null > /dev/null

  echo "You are cleared for take-off"
fi

mv tags ~/
mv cscope.out ~/
