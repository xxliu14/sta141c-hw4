DATAFILE="/scratch/transaction.zip"
#2.4
YEAR=5
unzip -p ${DATAFILE} | 
	cut --delimiter=, --fields=${YEAR} |
    sort --numeric-sort |
	uniq --count |
	sort --reverse --numeric-sort  |
	head -10 |
	cat > most_year.csv
