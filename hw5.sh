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

