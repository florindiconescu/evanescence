# Evanescence

[![Push & PR](https://github.com/florindiconescu/evanescence/actions/workflows/main.yml/badge.svg)](https://github.com/florindiconescu/evanescence/actions/workflows/main.yml)
[![Gem Version](https://badge.fury.io/rb/evanescence.svg)](https://badge.fury.io/rb/evanescence)

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

### In rails with activerecords:

Add `gem "evanescence"` to your gemfile.

In your `ApplicationRecord`:
```
require "evanescence/cacheable"

class ApplicationRecord < ActiveRecord::Base
  extend Evanescence::Cacheable
  ...
end
```

In your model class:
```
class Article < ApplicationRecord
  caches by: :id, max_size: 1000
  ...
end
```

In your controller:
```
Article.get_by(params[:id])
```


## Next steps
Expire the cache after given time.

Enhance the API.
