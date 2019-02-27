# modify table to be readable
cat con_table.csv | 
    sed s/./,/8 | # add a ',' between count and digit
    tail -n +3 |
    cat > modified_table.csv 
