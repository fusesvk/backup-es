# elasticsearch url
nes="http://localhost:9200" 
# source index
index="njoin-nuser"
# types to backup/restore
types=("type1" type2)
# limit of batch size
limit=1000
# backup index
current_date=$(date +%d%m%y) # Get the current date in ddmmyy format
backup="backup-$index-$current_date"

