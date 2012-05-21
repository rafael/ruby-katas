require 'rubygems'
require 'minitest/autorun'
require File.join(File.dirname(__FILE__), "/linked_lists")

describe "Likend lists Exercises" do
  it "add values in a proper way" do
    linked_list =  Node.new(1)
    linked_list.values.must_equal [1]
    linked_list.add_to_tail(2)
    linked_list.add_to_tail(3)
    linked_list.add_to_tail(4)
    linked_list.values.must_equal [1,2,3,4]
  end

  describe "#delete" do

    it "does nothing when the value is not in the list" do
      linked_list =  Node.new(1)
      linked_list.add_to_tail(2)
      linked_list.add_to_tail(3)
      linked_list.delete(3)
      linked_list.values.must_equal [1,2]
    end

    it "deletes the element when is in the list" do
      linked_list =  Node.new(1)
      linked_list.add_to_tail(2)
      linked_list.add_to_tail(3)
      linked_list = linked_list.delete(2)
      linked_list.values.must_equal [1,3]
      linked_list = linked_list.delete(3)
      linked_list.values.must_equal [1]
      linked_list = linked_list.delete(1)
      linked_list.must_equal nil
    end
  end

  describe "#delete duplicates" do
    it "deletes the duplicates element when in the list" do
      linked_list =  Node.new(1)
      linked_list.add_to_tail(2)
      linked_list.add_to_tail(2)
      linked_list.add_to_tail(3)
      linked_list.add_to_tail(2)
      linked_list.delete_duplicates
      linked_list.values.must_equal [1,2,3]
    end
  end

  describe "#nth_to_last_values" do
    it "returns the values from nth to last elemnt of a linked list" do
      linked_list =  Node.new(1)
      linked_list.add_to_tail(2)
      linked_list.add_to_tail(3)
      linked_list.add_to_tail(4)
      linked_list.add_to_tail(5)
      linked_list.nth_to_last_values(1).must_equal [2,3,4,5]
      linked_list.nth_to_last_values(2).must_equal [3,4,5]
      linked_list.nth_to_last_values(3).must_equal [4,5]
    end
  end


  describe "#nth_to_last_values" do
    it "returns the values from nth to last elemnt of a linked list" do
      linked_list =  Node.new(9)
      linked_list.add_to_tail(2)
      linked_list.add_to_tail(3)
      linked_list_b =  Node.new(2)
      linked_list_b.add_to_tail(2)
      linked_list_b.add_to_tail(4)
      linked_list.sum_linked_lists(linked_list_b).values.must_equal([7,5,1])
      ##
      
      linked_list =  Node.new(3)
      linked_list.add_to_tail(1)
      linked_list.add_to_tail(5)
      linked_list_b =  Node.new(5)
      linked_list_b.add_to_tail(9)
      linked_list_b.add_to_tail(2)
      linked_list_b.add_to_tail(2)
      linked_list.sum_linked_lists(linked_list_b).values.must_equal([2,8,0,8])
    end
  end

end
