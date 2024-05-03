module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0...self.length
      yield(self[i], i)
    end
    self
  end

  def my_select
    selected = []
    self.each do |elem|
      selected << elem if yield(elem)
    end
    selected
  end

  def my_all?
    self.each do |elem|
      if yield(elem) == false
        return false
      end
    end
    true
  end

  def my_any?
    self.each do |elem|
      if yield(elem) == true
        return true
      end
    end 
    false
  end

  def my_none?
    self.each do |elem|
      if yield(elem) == true
        return false
      end
    end 
    true
  end

  def my_count
    count = 0
    if block_given?
      self.each do |elem|
        if yield(elem)
          count += 1
        end
      end
    else
      count = 0
      self.each do
        count += 1
      end
    end
    count
  end

  def my_map
    result = []
    self.each do |elem|
      result << yield(elem)
    end
    result
  end

  def my_inject(initial_value)
    accumulator = initial_value
    self.each do |elem|
      accumulator = yield(accumulator, elem)
    end
    accumulator
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0...self.length
      yield(self[i])
    end
    self
  end
end
