require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if resize?
      resize!
    end
    
    unless include?(key)
      self[key] << key
      @count += 1
    end

  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self[key].delete(key)
  end

  private

  def [](el)
    @store[el.hash % num_buckets] 
  end

  def num_buckets
    @store.length
  end
  
  def resize?
    return true if count >= num_buckets
  end

  def resize!
    all_elements = @store.flatten
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }
    all_elements.each do |ele|
      insert(ele)
    end
  end
end
