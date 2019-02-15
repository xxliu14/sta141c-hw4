DATAFILE="/scratch/transaction.zip"
#1.5
# ref: https://ss64.com/bash/sort.html
# total obligation: col 8, decription: col 25
TOT_OBLIGATION=8
DESCRIPTION=25
unzip -p ${DATAFILE} | 
	cut --delimiter=, --fields=${TOT_OBLIGATION},${DESCRIPTION} |
	awk '$2!=""' |
	sort --field-separator=, --key=1,1 --reverse --numeric-sort |
	head -n50 |
	cat > largest50.csv
# find unique values
cat largest50.csv | 
	uniq |
	cat > unique_large.csv