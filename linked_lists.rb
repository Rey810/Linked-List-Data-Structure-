class LinkedList
    #represents the full list
    attr_accessor :head, :tail, :size

    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

    def append(node)  
        #adds a new node to the end of the list  
        @size += 1     
        if @head.nil?
            @head = node
            @tail = node
        else
            @tail.next_node = node                  #changes the tail nodes pointer to the current node
            @tail = node                            #this new node becomes the tail node 
            @tail.next_node = nil                   #the new tail needs to point to nil as there is no node after it
        end
        
    end

    def prepend(node)
        #adds a new node to the start of the list
        if @head.nil?
            @head = node
            @tail = node
        else
            node.next_node = @head                  #changes the nodes pointer to the current head
            @head = node                            #makes the node the new head
        end
        @size += 1
    end

    def size
        #returns the total numbeer of nodes in the list
        puts @size
    end

    def head
        #returns the first node in the list
        puts @head.value
    end

    def tail
        #returns the last node in the list
        puts @tail.value
    end

    def at(index)
        #returns the node at given index
        current_node = @head
        index.times { current_node = current_node.next_node }       #each time, it sets the current node to the value of it's pointer node
        current_node
    end

    def pop
        #removes the last element from the list
        @tail = at(@size-2)
        @tail.next_node = nil
        @size -= 1
    end

    def contains?(value)
        current_node = @head                                        #starting point for iteration
        @size.times do
            if current_node.value == value
                return true
            end
            current_node = current_node.next_node               #this changes the current node to the next node in the list
        end
        false
    end

    def find(data)
        #returns the index of the node containing data, or nil
        current_node = @head
        @size.times do |i|
            if current_node.value == data
                return i 
            end
            current_node = current_node.next_node
        end
        nil
    end

    def to_s
        #converts the list to a string visually representing a linked-list
        current_node = @head
        @size.times do |i|
            print "(#{current_node.value}) -> "
            current_node = current_node.next_node
        end
        print 'nil'
        puts
    end

    def insert_at(new_node, index)
    #inserts the node at the given index
        if index == 0
            puts "Use .append() method instead if adding a value to the beginning of the list"
        end
        new_node.next_node = at(index)              #sets the pointer of the new node to the original node at the index position, essentially, this plops in a new node and just rearranges the relevant pointers 
        at(index-1).next_node = new_node
        @size += 1
    end

    def remove_at(index)
    #remove_at(index) that removes the node at the given index. 
        at(index-1).next_node = at(index).next_node         #changes the pointer of the node before the index that wants to be removed so that the node at the target index is exclded from the list
        @size -= 1 
    end
end

class Node
    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
        @value = value
        @next_node = next_node 
    end
end

list = LinkedList.new

node1 = Node.new
node1.value = 10
node2 = Node.new
node2.value = 20
node3 = Node.new
node3.value = 30
node4 = Node.new
node4.value = 40
node5 = Node.new
node5.value = 100

list.append(node1)
list.append(node2)
list.append(node3)
list.append(node4)
# list.size
# list.head
puts "This is at(3): #{list.at(3).value}"
puts "This is at(2): #{list.at(2).value}"
puts "This is at(1): #{list.at(1).value}"
puts "This is at(0): #{list.at(0).value}"
puts list.contains?(10)
list.insert_at(node5, 0)
list.to_s

