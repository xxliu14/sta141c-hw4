#1.5
# ref: https://ss64.com/bash/sort.html
# total obligation: col 8, decription: col 25
TOT_OBLIGATION=8
DESCRIPTION=25
unzip -p ${DATAFILE} | 
	cut --delimiter=, --fields=${TOT_OBLIGATION},${DESCRIPTION} |
	sort --key=${TOT_OBLIGATION} -nr |
	head |
	cat > largest.csv