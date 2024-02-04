module Evanescence
  # Simple implementation of caching
  class Cache
    def initialize(max_size:)
      @items = {}
      @max_size = max_size
    end

    def to_h
      items.transform_values(&:first)
    end

    def write(key, val)
      reject_least_used_item if max_size
      existing_item = items[key]
      existing_item ? update_value(existing_item, val) : items[key] = [val, 1]

      items[key].first
    end

    def read(key)
      item = items[key]
      return unless item

      item[1] += 1 if max_size
      item.first
    end

    def delete(key)
      items.delete(key)
    end

    def clear
      count_before_clear = count
      items.clear
      count_before_clear
    end

    def count
      items.count
    end

    private

    attr_reader :items, :max_size

    def update_value(item, value)
      item.tap do |i|
        i.first = value
        i[1] += 1 if max_size
      end
    end

    def reject_least_used_item
      return if items.size < max_size

      min = items.min_by { |_, v| v.last }
      delete(min[0])
    end
  end
end
