#!/bin/bash

# Source the config file
source ./config.sh

# Get the current date in ddmmyy format
current_date=$(date +%d%m%y)
backup="backup-$index-$current_date"

echo "Backup index: $backup"

# Declare an array to store the results
declare -a results

# Loop over each type
for type in "${types[@]}"; do
  # create backup index
  npx elasticdump \
    --input=$nes/$index/$type \
    --output=$nes/$backup \
    --type=mapping

  npx elasticdump \
    --input=$nes/$index/$type \
    --output=$nes/$backup \
    --type=data \
    --limit=$limit

  # Get the count of documents in the source index
  source_count=$(curl -s "$nes/$index/$type/_count" | jq '.count')

  # Get the count of documents in the backup index
  backup_count=$(curl -s "$nes/$backup/$type/_count" | jq '.count')

  # Compare the counts and store the result
  if [ "$source_count" -eq "$backup_count" ]; then
    results+=("Backup of $type completed successfully: $backup_count documents")
  else
    results+=("Backup of $type failed: $source_count documents in source, $backup_count documents in backup")
  fi
done

echo "=============================================================================="
echo "Backup to index: $backup"
# Print all results
for result in "${results[@]}"; do
  echo "$result"
done

echo "==============================================================================="