# elasticsearch url
nes="http://kbank-es-prod-lb.convolab.ai:9200" 
# source index
index="njoin-kbank-lineapi-prod02"
# types to backup/restore
types=("flow" "flow-Linklogic" "account" "variables")
# limit of batch size
limit=10