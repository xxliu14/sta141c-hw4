cat modified_rec_digit.csv |
    sort --numeric-sort |
    uniq --count |
    cat > con_table.csv 