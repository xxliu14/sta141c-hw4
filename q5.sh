cat rec_digit.csv | 
    awk -F, '$1!="0"' |
    awk -F, '$1!="-"' |
    cat > modified_rec_digit.csv 