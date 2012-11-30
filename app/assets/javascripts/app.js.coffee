# Provides a key value store to get data into js without new query
@client =
  data: {}
  store: (key, val) -> @data[key] = val
  get:   (key)      -> @data[key]
