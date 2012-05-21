require 'ruby-debug'
class Node
  attr_accessor :next, :value

  def initialize(value, linked_list = nil)
    @value = value
    @next  = linked_list
  end

  def add_to_tail(value, start_node = self)
    if start_node.next == nil
      node =  Node.new(value)
      start_node.next = node
      return
    else
      add_to_tail(value, start_node.next)
    end
  end

  def delete(value)
    iterate_node = self
    return iterate_node.next if iterate_node.value == value
    while (iterate_node.next != nil) do
      next_node = iterate_node.next
      if next_node.value == value
        iterate_node.next = next_node.next
        return self
      end
      iterate_node = next_node
    end
  end

  def delete_duplicates
    hash_counter = {}
    hash_counter[self.value] = true
    iterate_node = self
    while (iterate_node.next != nil) do
      next_node = iterate_node.next
      if hash_counter[next_node.value]
        iterate_node.next = next_node.next
      else
        hash_counter[next_node.value] = true
      end
      iterate_node = next_node
    end
  end

  def nth_to_last_values(nth)
    counter = 0
    head = self
    values = []
    while (head != nil) do
      values << head.value if counter >= nth
      counter += 1
      head = head.next
    end
    values
  end

  def sum_linked_lists(list)
    head = self
    list_head = list
    values = []
    carrier = 0
    while  (head != nil || list_head != nil) do
      head_val = head.nil? ? 0 : head.value
      list_head_val = list_head.nil? ? 0 : list_head.value
      acum = (head_val + list_head_val + carrier) % 10
      carrier = (head_val + list_head_val + carrier) / 10
      values << acum
      head = head.next if head
      list_head = list_head.next if list_head
    end
    real_numbers = values.reverse
    new_list = Node.new(real_numbers[0])
    real_numbers.slice(1..-1).each do |val|
      new_list.add_to_tail(val)
    end
    new_list
  end


  def values
    values = []
    values << self.value
    iterate_node = self
    while (iterate_node.next != nil) do
      iterate_node = iterate_node.next
      values << iterate_node.value
    end
    values
  end
end


linked_list =  Node.new(1)
linked_list = linked_list.delete(1)

