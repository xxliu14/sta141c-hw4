# 1.5
DATAFILE="/scratch/transaction.zip"
# 1.1
# ref: https://ss64.com/bash/tr.html
unzip -p ${DATAFILE} |
	head -n 1 |
	tr ',' '\n' |
	nl |
	cat > colname_index.txt