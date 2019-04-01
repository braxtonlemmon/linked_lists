#!/home/braxton/.rbenv/shims/ruby

class LinkedList
	attr_accessor :size, :head, :tail
	
	def initialize
		@size = 0
		@head = nil
		@tail = nil
	end

	def append(value)
		node = Node.new(value)
		@head ? (@tail.next_node = node) : (@head = node)
		@tail = node
		@size += 1
	end

	def prepend(value)
		node = Node.new(value)
		@head ? (node.next_node = node) : (@tail = node)
		@head = node
		@size += 1
	end

	def size
	end

	def head
	end

	def tail
	end

	def at(index)
	end

	def pop
	end

	def contains?
	end

	def find(data)
	end

	def to_s
	end

	def insert_at(index)
	end

	def remove_at(index)
	end
end

class Node
	attr_accessor :value, :next_node

	def initialize(value=nil)
		@value = value
		@next_node = nil
	end
end

# I will first create a new list:
## my_list = List.new
# I will now be able to add nodes, so first I need to create one.
## node1 = Node.new('banana')
# Now I can append it...
## my_list.append(node1)
my_list = LinkedList.new
my_list.prepend('monkey')
my_list.prepend('fries')
my_list.append('apple')
print my_list
