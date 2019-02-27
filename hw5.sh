DATAFILE='/scratch/transaction.zip'

# subset the needed columns
parent_recipient_id=52
action_date=3
total_obligation=8
# ref: https://ss64.com/bash/sort.html
unzip -p ${DATAFILE} | 
	cut --delimiter=, --fields=${parent_recipient_id},${action_date},${total_obligation} |
    sort -u |
	cat > rm_duplicate.csv



