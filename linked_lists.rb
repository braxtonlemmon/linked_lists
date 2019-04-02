#!/home/braxton/.rbenv/shims/ruby

class List
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
		node = Node.new(value, @head)
		(@tail = node) unless @head
		@head = node
		@size += 1
	end

	def head
		@head.value
	end

	def tail
		@tail.value
	end

	def at(index)
		if index < 0 || index > @size
			nil
		else
			node = @head
			index.times { node = node.next_node }
			node.value
		end
	end

	def pop
		if @size == 0
			nil
		else
			node = @head
			(@size - 2).times { node = node.next_node }
			@tail = node
			@tail.next_node = nil
			@size -= 1
		end		
	end

	def contains?(value)
		if @size == 0
			nil
		else
			node = @head
			(node = node.next_node) until (node.value == value || node.next_node.nil?)
		end
		node.value == value
	end

	def find(data)
		if @size == 0
			nil
		else
			index = 0
			node = @head
			until node.value == data || node.next_node.nil?
				index += 1
				node = node.next_node
			end
		end
		node.value == data ? index : nil
	end

	def to_s
		string = ""
		node = @head
		@size.times do
			string << "(#{node.value}) -> "
			node = node.next_node
		end
		string + "nil"
	end

	def insert_at(value, index)
		if index < 0 || index > @size
			nil
		else
			node = @head
			(index - 1).times { node = node.next_node }
			new_node = Node.new(value, node.next_node)
			node.next_node = new_node
			@size += 1
		end
	end

	def remove_at(index)
		if index < 0 || index >= @size
			nil
		else
			node = @head
			if index == 0
				@head = node.next_node
			else
				(index - 1).times { node = node.next_node }
				node.next_node = node.next_node.next_node
			end
			@size -= 1
		end
	end
end

class Node
	attr_accessor :value, :next_node

	def initialize(value=nil, next_node=nil)
		@value = value
		@next_node = next_node
	end
end

list = List.new
puts list
list.append("Chicken")
list.append("Yogurt")
list.prepend("Rainbow")
list.insert_at("Watermelon", 2)
list.remove_at(1)
list.prepend("Yo-Yo")
list.pop
p list.contains?("Rainbow")
p list.contains?("Yogurt")
p list.find("Rainbow")
p list.tail
p list.head
p list.at(5)
p list.at(2)

puts list
