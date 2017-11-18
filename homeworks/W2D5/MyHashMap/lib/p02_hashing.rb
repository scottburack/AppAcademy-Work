class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    #return nil.hash if self == []
    self.each_with_index do |el, i|
      temp = i ^ el.hash
      result += temp
    end
      
    return result
  end
end

class String
  def hash
    result = 0 
    i = 0 
    self.each_byte do |c|
      temp = c ^ i 
      result += temp
      i += 1
    end 
    result
  end 
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.each do |k,v|
      result += k.hash ^ v.hash
    end
    result
  end
end
