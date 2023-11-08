module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |element|
      yield(element, index)
      index += 1
    end
  end

  def my_select
    result = []
    my_each do |element| 
      result << element if yield(element)
    end
    result
  end

  def my_all?
    my_each do |element| 
      return false unless yield(element)
    end
    true
  end

  def my_any?
    my_each do |element| 
      return true if yield(element)
    end
    false
  end

  def my_none?
    my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count(arg = nil)
    count = 0

    if block_given?
      my_each { |element| count += 1 if yield(element) }
    elsif arg
      my_each { |element| count += 1 if element == arg }
    else
      my_each { count += 1 }
    end

    count
  end

  def my_map
    result = []
    my_each do |element|
      result << yield(element)
    end
    result
  end

  def my_inject(initial = nil)
    result = initial || self.first
    elements = initial ? self : self[1..-1]
    elements.my_each { |element| result = yield(result, element) }
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
   def my_each
    for element in self
      yield(element)
    end
  end
end