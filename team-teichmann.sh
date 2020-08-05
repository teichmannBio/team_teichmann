#!/bin/bash
REPO=https://github.com/teichmannBio/team_teichmann.git
NAME=$(echo $REPO|sed -r 's^.*/(.*).git^\1^')
OUTPUT_FILE=team-teichmann.csv
git clone $REPO
cd $NAME
for file in $(ls) ; do
        if [[ $file == *.py ]]; 
	then
                python $file |sed 's/ /,/g' >> $OUTPUT_FILE
	elif [[ $file == *.js ]];
	then
                node $file |sed 's/ /,/g' >> $OUTPUT_FILE
        elif [[ $file == *.R ]];
	then
                Rscript $file |sed G |sed 's/ /,/g' >> $OUTPUT_FILE  
	fi
done
