# 1.5
DATAFILE="/scratch/transaction.zip"
# 1.4
#ref:https://stackoverflow.com/questions/19602181/how-to-extract-one-column-of-a-csv-file
# agency id : col 18
AGC_ID=18
unzip -p ${DATAFILE} | 
	cut --delimiter=, --fields=${AGC_ID} |
	sort --numeric-sort |
	uniq |
	cat > funding_agencies_set.txt