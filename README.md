# Evanescence

In memory cache that expires the least used items, and limits the cache size by a maximum number of items.

## Usage

Initiate a cache object. It requires the max number of records as an argument:
```
cache = Evanescence.initialize_cache(max_size: 1000)
```
Write to cache: `cache.write("key", value)`

Read from cache: `cache.read("key")`

Delete from cache: `cache.delete("key")`

Delete the entire cache: `cache.clear`

Check the cache size: `cache.count`

## Next steps
Allow the cache to grow without a maximum size limit.

Expire the cache after given time.

Enhance the API.
