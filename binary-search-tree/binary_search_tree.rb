=begin
Write your code for the 'Binary Search Tree' exercise in this file. Make the tests in
`binary_search_tree_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search-tree` directory.
=end
class Bst 
    attr_accessor :data, :left, :right

    def initialize(value)
        @data = values
        @right = nil
    end

    def insert ()
    end
end 

class Binary_search_tree
    attr_accessor :root, :size

    def intitialize()
        @root = nil
        @size = 0
    end
    def insert(value)
      if @root == nil
          @root = Bst.new(value)
      else
          curr_node = @root
          previous_node = @root
          #while loop helps finding the position of insertion
          while curr_node != nil
              previous_node = curr_node
              if value < curr_node.value
                  curr_node = curr_node.left
              else
                  curr_node = curr_node.right
              end
          end
          if value < previous_node.value
              previous_node.left = Bst.new(value)
          else
              previous_node.right = Bst.new(value)
          end
      end
      @size += 1
  end
end