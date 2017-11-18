require 'byebug'

class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    
  end
end

class LinkedList
  include Enumerable
  
  attr_accessor :head, :tail
  def initialize
    @head = Node.new(:head,nil)
    @tail = Node.new(:tail,nil)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    # debugger
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    node = @head
    until node.next == nil 
      return node.val if node.key == key 
      node = node.next
    end 
    nil
  end

  def include?(key)
    node = @head
    until node.next == nil 
      return true if node.key == key 
      node = node.next
    end 
    false
  end

  def append(key, val)
    temp_node = @tail.prev
    node = Node.new(key,val)
    @tail.prev = node
    node.next = @tail
    temp_node.next = node
    node.prev = temp_node  
  end

  def update(key, val)
    node = @head
    until node.next == nil 
        if node.key == key 
          node.val = val
          break
        end 
      node = node.next
    end
  end

  def remove(key)
    node = @head
    until node.next == nil
      if node.key == key
        k_next = node.next
        k_prev = node.prev
        k_prev.next = k_next
        k_next.prev = k_prev
      end
      node = node.next
    end
  end

  def each(&prc)
    return nil if self.empty?
    node = self.first
    until node.next == nil
      prc.call(node)
      node = node.next
    end 
    return self
    
  end
  # 
  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
