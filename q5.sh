DATAFILE="/scratch/transaction.zip"
#2.4
REC_ID=15
REC_NAME=51
unzip -p ${DATAFILE} | 
	cut --delimiter=, --fields=${REC_ID},${REC_NAME} |
	awk '$2!=""' |
	sort --field-separator=, --key=1,1 --numeric-sort |
	uniq --count |
	sort --field-separator=, --key=1,1 --reverse --numeric-sort |
	head -30 |
	cat > most_rec.csv
