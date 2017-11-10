class Map

  def initialize
    @my_map = []
  end

  def assign(key, value)
    my_map << key
    my_map << value
    my_map
  end

  def lookup(key)
    self.each do |subarrays|
      subarrays[0].select {|el| el == key}
    end
  end

  def remove(key)
    self.each do |subarrays|
      subarrays[0].delete! {|el| el == key}
    end
  end


end
