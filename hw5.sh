DATAFILE='/scratch/transaction.zip'

PARENT_RECIPIENT_ID=52
ACTION_DATE=3
TOTAL_OBLIGATION=8
# ref: https://ss64.com/bash/sort.html
unzip -p ${DATAFILE} | 
	cut --delimiter=, --fields=${PARENT_},${ACTION_DATE},${TOTAL_OBLIGATION} |
    sort --uniq |
	cat > duplicate_rm_3col.csv

#paste -d, digit1.csv temp2.csv

