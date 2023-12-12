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

1. Edit values in config.sh where `index` is backup index and `types` are the types that you want to restore. Then run `./v5-backup.sh`