module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0...self.length do
      yield(self[i], i)
    end
    self
  end

  def my_select
    result = []
    self.my_each { |value| result << value if yield(value)}
    result
  end

  def my_all?
    self.my_each { |value| return false unless yield(value)}
    return true
  end

  def my_any?
    self.my_each { |value| return true if yield(value)}
    return false
  end

  def my_none?
    self.my_each { |value| return false if yield(value)}
    return true
  end

  def my_count
    if block_given?
      count = 0
      self.my_each { |value| count += 1 if yield(value)}
      count
    else
      self.length
    end
  end

  def my_map
    if block_given?
      result = []
      self.my_each { |value| result << yield(value)}
      result
    end
  end

  def my_inject(initial_value)
    result = initial_value
    self.my_each { |value| result = yield(result, value)}
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0...self.length do
      yield(self[i])
    end
    self
  end
end
