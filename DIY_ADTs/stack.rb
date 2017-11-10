class Stack

  def initialize
    @stack_storage = stack_storage
  end

  def add(el)
    stack_storage << el
  end

  def remove
    stack_storage.pop
  end

  def show
    copy = stack_storage
    copy
  end

end
