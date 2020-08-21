rnd=$RANDOM
# get all files
find . -name '*.tikz' -type f | xargs -I 'fl' sh -c 'file=fl && filens=${file%.tikz} && echo "$file $(basename ${filens##*/})"' >> $rnd
# get all folders, the space is for the latex command read-in
find images -type d | xargs -I'{}' echo " ./{}" >> $rnd
cat $rnd | sort -b - > $rnd.out
sed -i -e 's/^ .\/images\//:/g' $rnd.out
# sort to get grouping
tail -n +2 $rnd.out
rm $rnd $rnd.out