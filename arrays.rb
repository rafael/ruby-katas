require 'ruby-debug'
class Array
  def merge(array)
    merged_array = []
    self_index = 0
    array_index = 0
    while self_index < self.size && array_index < array.size do
      if self[self_index] < array[array_index]
        merged_array << self[self_index]
        self_index += 1
      else
        merged_array << array[array_index]
        array_index += 1
      end
    end
    if array_index < array.size
      merged_array = merged_array + array.slice(array_index..-1)
    end

    if self_index < self.size
      merged_array = merged_array + self.slice(self_index..-1)
    end
    merged_array
  end

  def merge_sort
    return self if self.size < 2
    half = (self.size-1)/2
    left = self.slice(0..half).merge_sort
    rigth = self.slice(half+1..-1).merge_sort
    return left.merge(rigth)
  end

  def quick_sort
    return self if self.size < 2
    pivot = self[(self.size-1)/2]
    self.delete(pivot)
    left = self.select {|val|  val < pivot }
    rigth = self.select {|val| val > pivot }
    return left.quick_sort + [pivot] + rigth.quick_sort
  end
end

