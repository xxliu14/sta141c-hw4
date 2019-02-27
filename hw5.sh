DATAFILE='/scratch/transaction.zip'

PARENT_RECIPIENT_ID=52
ACTION_DATE=3
TOTAL_OBLIGATION=8

# remove duplicates
unzip -p ${DATAFILE} | 
	cut --delimiter=, --fields=${TOTAL_OBLIGATION},${PARENT_RECIPIENT_ID},${ACTION_DATE} |
    sort --uniq |
	cat > duplicate_rm_3col.csv


FIRST_DIGIT=1
TOTAL_OBLIGATION2=2
PARENT_RECIPIENT_ID2=3

# extract id column
cat duplicate_rm_3col.csv |
    cut --delimiter=, --fields=${PARENT_RECIPIENT_ID2} | 
    cat > rec_id.csv

# extract obligation column 
cat duplicate_rm_3col.csv |
    cut --delimiter=, --fields=${TOTAL_OBLIGATION2} | 
    cat > obli.csv

# extract first digit
cat obli.csv |
    cut --characters=${FIRST_DIGIT} |
    cat > digit1.csv

# combine to one file
paste --delimiters=, digit1.csv rec_id.csv |
    cat > rec_digit.csv

# remove digit of - or 0
cat rec_digit.csv | 
    awk -F, '$1!="0"' |
    awk -F, '$1!="-"' |
    cat > modified_rec_digit.csv 

# count the number of 1-9 for each recipient
cat modified_rec_digit.csv |
    sort --field-separator=, --key=1,1 --numeric-sort |
    uniq --count |
    cat > con_table.csv 

# modify table to be readable
cat con_table.csv | 
    sed s/./,/8 | # add a ',' between count and digit
    tail -n +3 |
    cat > modified_table.csv 
