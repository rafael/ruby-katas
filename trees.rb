require 'ruby-debug'
class TreeNode
  attr_accessor :value, :left_child, :rigth_child

  def initialize(value)
    @value = value
    @left_child = nil
    @rigth_child = nil
  end

  def add_value(value)
    if value < self.value && self.left_child == nil
      self.left_child = TreeNode.new(value)
    elsif value >= self.value && self.rigth_child == nil
      self.rigth_child = TreeNode.new(value)
    elsif value < self.value
      self.left_child.add_value(value)
    else
      self.rigth_child.add_value(value)
    end
  end

  def left_size(size = 0)
    if self.left_child.nil?
      return size
    else
      return self.left_child.left_size(size+=1)
    end
  end

  def rigth_size(size = 0)
    if self.rigth_child.nil?
      return size
    else
      return self.rigth_child.rigth_size(size+=1)
    end
  end

  def balanced?
    return false if self.left_size - self.rigth_size > 1

    if self.left_child != nil 
      return false if !self.left_child.balanced?
    end

    if self.rigth_child != nil
      return false if !self.rigth_child.balanced?
    end

    true
  end

  def traverse_preorder
    traversed_tree = []
    traversed_tree << self.value
    traversed_tree += self.left_child.traverse_preorder.flatten if self.left_child
    traversed_tree += self.rigth_child.traverse_preorder.flatten if self.rigth_child
    traversed_tree
  end

  def traverse_inorder
    traversed_tree = []
    traversed_tree += self.left_child.traverse_preorder.flatten if self.left_child
    traversed_tree << self.value
    traversed_tree +=  self.rigth_child.traverse_preorder.flatten if self.rigth_child
    traversed_tree
  end

  def traverse_postorder
    traversed_tree = []
    traversed_tree += self.left_child.traverse_preorder.flatten if self.left_child
    traversed_tree += self.rigth_child.traverse_preorder.flatten if self.rigth_child
    traversed_tree << self.value
    traversed_tree
  end

end
