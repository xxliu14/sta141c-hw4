#DATAFILE="/scratch/transaction.zip"
# For testing:
DATAFILE="/home/clarkf/data/trans.zip"

# Example:
unzip -p ${DATAFILE} | 
    head |
    cat > result.txt
