df0 = read.csv('modified_table.csv', header = FALSE)
colnames(df0) = c('count', 'digit', 'id')
df0 = df0[complete.cases(df0), ]
df0$count = as.numeric(df0$count)
df1 = aggregate(count ~ id, df0, sum)
df1 = subset(df1, df1$count >= 100)
df0 = subset(df0, df0$id %in% df1$id)

write.table(df1, file = 'df1.csv',row.names=FALSE, na='',col.names=FALSE, sep=',')

df_digit_sum = aggregate(count ~ digit, df0, sum)

compute_part = function(id,count,digit){
  ls_Q = df_digit_sum$count/sum(df_digit_sum$count)
  total_p_count = sum(df0$count[which(df0$id==id)])
  px = count / total_p_count
  qx = ls_Q[digit]
  return(px*log(px/qx))
}

df0$part_to_sum = mapply(compute_part,df0$id,df0$count,df0$digit)
write.table(df0, file = 'df0.csv',row.names=FALSE, na='',col.names=FALSE, sep=',')

df2 = aggregate(part_to_sum ~ id, df0, sum)
write.table(df2, file = 'df2.csv',row.names=FALSE, na='',col.names=FALSE, sep=',')

