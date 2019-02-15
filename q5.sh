# 1.5
DATAFILE="/scratch/transaction.zip"
TOT_OB=8
DESCRIPTION=25
unzip -p ${DATAFILE} | 
	cut -d ',' -f ${TOT_OB,DESCRIPTION} |
	sort -k ${TOT_OB} -nr |
	head |
	cat > largest.csv