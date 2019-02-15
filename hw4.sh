DATAFILE="/scratch/transaction.zip"
# For testing from head node:
#DATAFILE="/group/staclassgrp/transaction.zip"

# 1.1
unzip -p ${DATAFILE} |
	head -1 |
	tr ',' '\n' |
	nl |
	cat > colname_index.txt

# 1.2
unzip -p ${DATAFILE} |
	wc -L |
	cat > maxchars.txt

# 1.3
# ref: https://ss64.com/bash/grep.html
unzip -p ${DATAFILE} | 
	grep -i "bicycle" | 
	nl |
	cat > bicycle.csv


# 1.4
#ref:https://stackoverflow.com/questions/19602181/how-to-extract-one-column-of-a-csv-file
# agency id : col 18
AGC_ID=18
unzip -p ${DATAFILE} | 
	cut -d ','  -f{AGC_ID} |
	sort -n |
	uniq |
	cat > funding_agencies_set.txt

#1.5
# obli: col 8, decri: col 25
TOT_OB=8
DESCRIPTION=25
unzip -p ${DATAFILE} | 
	cut -d ',' -f ${TOT_OB,DESCRIPTION} |
	sort -k ${TOT_OB} -nr |
	head |
	cat > largest.csv

