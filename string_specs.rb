require 'rubygems'
require 'minitest/autorun'
require File.join(File.dirname(__FILE__), "string")

describe "String Tets" do
  describe "#unique_chars" do
    it "returns false if there are repeated chars" do
      "dsad".unique_chars?.must_equal false
    end

    it "returns true if all chars are unique" do
      "efsad".unique_chars?.must_equal true
    end
  end

  describe "reverse C-string" do
    it "returns the proper reversed string" do
      reverse_c_string("rafael\0").must_equal "leafar\0"
    end
  end

  describe "string with no duplicates" do
    it "returns a string with no duplicates" do
      "hola".remove_duplicates.must_equal "hola"
      "hhola".remove_duplicates.must_equal "hola"
      "hholah".remove_duplicates.must_equal "hola"
    end
  end

  describe "#anagram" do 
    it "returns true for string that are anagrams" do
      "Eleven plus two".anagram?("Twelve plus one").must_equal true
      "army".anagram?("mary").must_equal true
      "Dormitory".anagram?("Dirty room").must_equal true
      "The Morse code".anagram?("Here come dots").must_equal true
    end

    it "returns false for string that aren't anagrams" do
      "hola".anagram?("mary").must_equal false
    end

  end
end
