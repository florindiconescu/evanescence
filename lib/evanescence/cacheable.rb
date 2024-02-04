module Evanescence
  module Cacheable
    def caches(options = {})
      @by = options[:by]
      @max_size = options[:max_size]
      @cache = Evanescence.initialize_cache(max_size:)
    end

    def get_by(key)
      cache.read(key) || send("find_by_#{by}", key)&.tap { |object| write_by(key, object) }
    end

    def write_by(key, value)
      cache.write(key, value)
    end

    private

    attr_reader :by, :cache, :max_size
  end
end
