require 'rubygems'
require 'minitest/autorun'
require File.join(File.dirname(__FILE__), "/trees")

describe "Trees" do
  describe "#traverse_inorder" do
    it "returns an array with the tree traversed in order" do
      tree = TreeNode.new(5)
      tree.add_value(1)
      tree.add_value(2)
      tree.add_value(6)
      tree.add_value(7)
      tree.add_value(8)
      tree.add_value(3)
      tree.traverse_inorder.must_equal([1,2,3,5,6,7,8])
    end
  end

  describe "#left_size" do
    it "return the length from the root to the most left leaf in a node" do
      tree = TreeNode.new(9)
      tree.add_value(7)
      tree.add_value(5)
      tree.add_value(4)
      tree.left_size.must_equal(3)
    end
  end

  describe "#rigth_size" do
    it "return the length from the root to most rigth leaf in a node" do
      tree = TreeNode.new(1)
      tree.add_value(2)
      tree.add_value(3)
      tree.add_value(4)
      tree.rigth_size.must_equal(3)
    end
  end

  describe "#balanced?" do
    it "returns true if the tree is balanced" do
      tree = TreeNode.new(21)
      tree.add_value(20)
      tree.balanced?.must_equal(true)
      tree.add_value(15)
      tree.balanced?.must_equal(false)
      tree.add_value(35)
      tree.balanced?.must_equal(true)
      tree.add_value(30)
      tree.add_value(40)
      tree.balanced?.must_equal(true)
      tree.add_value(24)
      tree.balanced?.must_equal(true)
      tree.add_value(23)
      tree.balanced?.must_equal(false)
    end
  end

end
