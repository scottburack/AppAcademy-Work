require 'byebug'
class MaxIntSet
  attr_reader :max
  
  
  def initialize(max)
    @max = max
    @store = Array.new(max) {false}
  end

  def insert(num)
  #  debugger
  validate!(num)
  @store[num] = true
  end

  def remove(num)
      validate!(num)
    @store[num] = false
  end

#return true if num is in there
  def include?(num)
  #  debugger
    validate!(num)
    return @store[num]
  end

  private

  def is_valid?(num)
    (num).between?(0,max)
  end

  def validate!(num)
    raise 'Out of bounds' unless is_valid?(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    # if resize? 
    #    then resize and add to bucket
    # else
    #   just add to bucket
    if resize?
      resize!
    end
    
    unless include?(num)
      self[num] << num
      @count += 1
    end

  end

  def remove(num)
    self[num].delete(num)
    # @count -= 1
  
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
      @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
  def resize?
    return true if count >= num_buckets
  end 

# we are assuming count > num_buckets

  def resize!
    all_elements = @store.flatten
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }
    all_elements.each do |ele|
      insert(ele)
    end
  end
  
  # def elements
  #   all_elements = []
  #   @store.each do |bucket|
  #     bucket.each do |ele|
  #       all_elements << ele
  #     end
  #   end
  #   all_elements
  # end
  
  
end
