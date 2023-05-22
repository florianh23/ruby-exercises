=begin
Write your code for the 'Binary Search Tree' exercise in this file. Make the tests in
`binary_search_tree_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search-tree` directory.
=end

class BinaryTree # TreeStructure
    attr_accessor :root
    
    def initialize(node)
        self.root = node
    end
    
    def search(data) 
        #use recursion to find given value
        # 1. check if root is value
        # 2. if not go search at  children
        return true if root.data == data
        return search_helper(root, data)  
    end 
    
    def search_helper(node, data)
        return if node.nil?
        
        return true if node.data == data
        
        found = false
        found = search_helper(node.left, data) #depth first search: go down left side of the tree and come back to 
        return found if found == true
        return search_helper(node.right, data)
    end
end 

class Bst # Node
    attr_reader :data
    attr_accessor :left, :right

    def initialize(data)
        @data = data
        @left = nil
        @right = nil
    end

    def insert(value)
        if value > data
            right ? right.insert(value) : self.right = Bst.new(value)
        else
            left ? left.insert(value) : self.left = Bst.new(value)
        end
    end
    def each(&block)
        return enum_for(:each) unless block_given?
        left.each(&block) if left
        yield(data)
        right.each(&block) if right
    end
end 
