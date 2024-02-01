module Evanescence
  # Simple implementation of caching
  class Cache
    def initialize(max_size:)
      @max_size = max_size
      @items = {}
    end

    Item = Struct.new("Item", :value, :usage_counter)

    def to_h
      {}.tap do |h|
        @items.each { |k, v| h[k] = v.value }
      end
    end

    def write(key, val)
      reject_least_used_item
      existing_item = @items[key]
      existing_item ? update_value(existing_item, value) : @items[key] = Item.new(val, 1)

      @items[key].value
    end

    def read(key)
      item = @items[key]
      return unless item

      item.usage_counter += 1
      item.value
    end

    def delete(key)
      @items.delete(key)
    end

    def clear
      count_before_clear = count
      @items.clear
      count_before_clear
    end

    def count
      @items.count
    end

    private

    def update_value(item, value)
      item.tap do |i|
        i.value = value
        i.usage_counter += 1
      end
    end

    def reject_least_used_item
      return if @items.size < @max_size

      min = @items.min_by { |_, v| v.usage_counter }
      delete(min[0])
    end
  end
end
