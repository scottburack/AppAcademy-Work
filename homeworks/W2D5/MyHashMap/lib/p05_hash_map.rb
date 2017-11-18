require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    linked_bucket = bucket(key)
    linked_bucket.include?(key)
  end

  def set(key, val)
    
    if resize?
      resize!
    end
    
    
    
    linked_bucket = bucket(key)
    if include?(key) 
      delete(key)
    end 
    @count += 1
    linked_bucket.append(key,val)
  end

  def get(key)
    linked_bucket = bucket(key)
    @store[key.hash % num_buckets].get(key)
  end

  def delete(key)
    linked_bucket = bucket(key)
    linked_bucket.remove(key)
    @count -= 1
  end

  def each(&prc)
    @store.each do |list|
      list.each do |node|
        prc.call(node.key, node.val)
      end
    end
    
    self  
    
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    #taking all elements and storing them as k, v
    all_elements = elements
     p all_elements
     all_elements.delete([])
     p all_elements
    # all_elements.delete!([])
    @count = 0
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    all_elements.each do |ele|
      key = ele[0]
      val = ele[1]
      set(key,val)
    end
  end
  
  def elements 
    result = []
    @store.each do |bucket_list|
      node = bucket_list.first
      until node.next == nil 
        result << [node.key, node.val]
        node = node.next
      end
    end
    result   
  end 
  
  
  
  def resize?
    return true if count >= num_buckets
  end 

  def bucket(key)
    @store[key.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `key`
  end
end
