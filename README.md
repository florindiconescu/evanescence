# Evanescence

[![Push & PR](https://github.com/florindiconescu/evanescence/actions/workflows/main.yml/badge.svg)](https://github.com/florindiconescu/evanescence/actions/workflows/main.yml)

In memory cache which can limit the cache size by a maximum number by expiring the least used cached items.

## Usage

Initiate a cache object. Optionally pass the max number of records as an argument:
```
cache = Evanescence.initialize_cache(max_size: 1000)
```
Write to cache: `cache.write("key", value)`

Read from cache: `cache.read("key")`

Delete from cache: `cache.delete("key")`

Delete the entire cache: `cache.clear`

Check the cache size: `cache.count`

## Next steps
Expire the cache after given time.

Enhance the API.
