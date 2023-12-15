# How to backup and restore in ES5


### Backup
>
1. Edit values in `config.sh`
2. Run `./backup.sh`



### Restore
>
1. Delete types from source index by edit values in `_type` array.
    Example:

  ```
  POST index/_delete_by_query
  {
    "query": {
      "bool": {
        "must": [
          {
            "terms": {
              "_type": [
                "type1",
                "type2"
              ]
            }
          }
        ]
      }
    }
  }
  ```

1. Edit values in config.sh as below:
    ```
    index=backup_index
    backup=source_index
    types=type1,type2
    ```
   Then run `./v5-backup.sh`

Note: limit can be set to other value based on index size. Default is 1000.