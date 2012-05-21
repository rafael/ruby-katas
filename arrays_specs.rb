require 'rubygems'
require 'minitest/autorun'
require File.join(File.dirname(__FILE__), "/arrays")

describe "Arrays Exercices" do
  describe "#merge" do
    it "merges properly sorted arrays" do
      [1,2].merge([3,4]).must_equal([1,2,3,4])
      [1,2,3].merge([6,7]).must_equal([1,2,3,6,7])
      [1,4,7].merge([2,3,5,6]).must_equal([1,2,3,4,5,6,7])
    end
  end

  describe "#merge_sort" do
    it "sorts an array using merge sort" do
      [5,4,3,2,1].merge_sort.must_equal([1,2,3,4,5])
      [1,2,3].merge_sort.must_equal([1,2,3])
      [1,2,-1].merge_sort.must_equal([-1,1,2])
    end
  end

  describe "#quick_sort" do
    it "sorts an array using quick sort" do
      [5,4,3,2,1].quick_sort.must_equal([1,2,3,4,5])
      [1,2,3].quick_sort.must_equal([1,2,3])
      [1,2,-1].quick_sort.must_equal([-1,1,2])
    end
  end
end
