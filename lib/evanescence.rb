require_relative "evanescence/version"

module Evanescence
  autoload :Cache, "evanescence/cache"

  module_function

  def initialize_cache(max_size:)
    Cache.new(max_size:)
  end
end
