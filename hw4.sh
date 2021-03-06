DATAFILE="/scratch/transaction.zip"

# 1.1
# ref: https://ss64.com/bash/tr.html
unzip -p ${DATAFILE} |
	head -n 1 |
	tr ',' '\n' |
	nl |
	cat > colname_index.txt

# 1.2
unzip -p ${DATAFILE} |
	wc -L |
	cat > maxchars.txt

# 1.3
# ref: https://ss64.com/bash/grep.html
unzip -p ${DATAFILE} | 
	grep --ignore-case 'bicycle' | 
	nl |
	cat > bicycle.csv


# 1.4
# ref: https://stackoverflow.com/questions/19602181/how-to-extract-one-column-of-a-csv-file
# agency id : col 18
AGC_ID=18
unzip -p ${DATAFILE} | 
	cut --delimiter=, --fields=${AGC_ID} |
	sort --numeric-sort |
	uniq |
	cat > funding_agencies_set.txt

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

#2.4
# year: col 5
YEAR=5
unzip -p ${DATAFILE} | 
	cut --delimiter=, --fields=${YEAR} |
    sort --numeric-sort |
	uniq --count |
	sort --reverse --numeric-sort  |
	head -10 |
	cat > most_year.csv