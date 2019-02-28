df0 = read.csv('modified_table.csv', header = FALSE)
colnames(df0) = c('count', 'digit', 'id')
df0 = df0[complete.cases(df0), ]
df0$count = as.numeric(df0$count)
df0$digit = as.numeric(df0$digit)
df1 = aggregate(count ~ id, df0, sum)
df1 = subset(df1, df1$count >= 100)
colnames(df1) = c('id','tot_count')
#write.table(df1, file = 'df1.csv',row.names=FALSE, na='',col.names=FALSE, sep=',')

df0 = subset(df0, df0$id %in% df1$id)

df_digit_sum = aggregate(count ~ digit, df0, sum)
ls_Q = df_digit_sum$count/sum(df_digit_sum$count)

df_temp = merge(df0,df1,by='id')
df_temp$px = df_temp$count/df_temp$tot_count

compute_qx = function(digit){
  qx = ls_Q[digit]
  return(qx)
}
df_temp$qx = lapply(df_temp$digit,compute_qx)

compute_part = function(px,qx){
  return(px*log(px/qx))
}
df_temp$part = mapply(compute_part,df_temp$px,df_temp$qx)

df2 = aggregate(part ~ id, df_temp, sum)
colnames(df2) = c('id','KLD')

#write.table(df0, file = 'df0.csv',row.names=FALSE, na='',col.names=FALSE, sep=',')
df2 = aggregate(part_to_sum ~ id, df0, sum)
write.table(df2, file = 'df2.csv',row.names=FALSE, na='',col.names=FALSE, sep=',')

