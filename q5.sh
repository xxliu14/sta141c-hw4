DATAFILE="/scratch/transaction.zip"
#2.4
REC_ID=15
unzip -p ${DATAFILE} | 
	cut --delimiter=, --fields=${REC_ID} |
	sort --numeric-sort |
	uniq --count |
	sort --reverse |
	head -30 |
	cat > most_rec.csv
