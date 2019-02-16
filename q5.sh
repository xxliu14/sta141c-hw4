DATAFILE="/scratch/transaction.zip"
#2.4
REC_NAME=51
unzip -p ${DATAFILE} | 
	cut --delimiter=, --fields=${REC_NAME} |
	sort |
	uniq --count |
	sort --reverse |
	head -30 |
	cat > most_recv.csv
