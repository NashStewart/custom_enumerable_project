module Enumerable
  # Your code goes here
  def my_each_with_index
    if block_given?
      index = 0
      self.my_each do |element|
        yield element, index
        index += 1
      end
    end
    self
  end

  def my_select
    array = []
    self.my_each { |element| array << element if yield element }
    array
  end

  def my_all?
    self.my_each { |element| return false unless yield element }
    true
  end

  def my_any?
    self.my_each { |element| return true if yield element }
    false
  end

  def my_none?
    self.my_each { |element| return false if yield element }
    true
  end

  def my_count
    if block_given?
      count = 0
      self.my_each { |element| count += 1 if yield element }
      return count
    end
    self.size
  end

  def my_map
    array = []
    self.my_each { |element| array << yield(element) }
    array
  end

  def my_inject(accumulator = 0)
    self.my_each { |element| accumulator = yield accumulator, element }
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
    self.size.times { |i| yield self[i] } if block_given?
    self
  end
end
