
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node = nil)
    @data = value
    @next = next_node
  end
end

# Defines the singly linked list
class LinkedList
    def initialize
      @head = nil # keep the head private. Not accessible outside this class
    end

    # method to add a new node with the specific data value in the linked list
    # insert the new node at the beginning of the linked list
    def add_first(value)
      if @head.nil?
      @head = Node.new(value)
      else
        next_node = @head
        @head = Node.new(value, next_node)
      end
      return @head
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    def search(value)
      return false if @head.nil?
      return true if @head.data == value
      if @head.next
        checking_node = @head
        found = false
      end
      until checking_node.next == nil || found == true
        checking_node = checking_node.next
        if checking_node.data == value
          found = true
        end
      end
      return found
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      return nil if @head.nil?
      max = @head.data
      checking_node = @head
      until checking_node.next.nil?
        checking_node = checking_node.next
        if checking_node.data > max
          max = checking_node.data
        end
      end
      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    def find_min
      return nil if @head.nil?
      min = @head.data
      checking_node = @head
      until checking_node.next.nil?
        checking_node = checking_node.next
        if checking_node.data < min
          min = checking_node.data
        end
      end
      return min
    end


    # method that returns the length of the singly linked list
    def length
      return 0 if @head.nil?
      node_count = 1
      checking_node = @head
      until checking_node.next == nil
        node_count += 1
        checking_node = checking_node.next
      end
      return node_count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    def get_at_index(index)
      if index > self.length - 1
        return nil
      else
        checking_node = @head
        count = 0
        until count == index
          count += 1
          checking_node = checking_node.next
        end
      end
      return checking_node.data
    end

    # method to print all the values in the linked list
    def visit
      return nil if @head.nil?
      checking_node = @head
      until checking_node.next == nil
        puts checking_node.data
        checking_node = checking_node.next
      end
      puts checking_node.data
    end

    # method to delete the first node found with specified value
    def delete(value)
      return nil if @head.nil?
      checking_node = @head
      previous_node = nil
      until checking_node.nil?
        if checking_node.data == value
          if checking_node == @head
            @head = checking_node.next
          else
            previous_node.next = checking_node.next 
          end
        end
        previous_node = checking_node
        checking_node = checking_node.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    def reverse
      current_node = @head
      previous_node = nil
      until current_node.next == nil
        next_node = current_node.next
        current_node.next = previous_node
        previous_node = current_node
        current_node = next_node
      end
      @head = current_node
      @head.next = previous_node
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    def find_middle_value
      return nil if @head.nil?
      times_to_go = self.length / 2
      current_node = @head
      times_to_go.times do
        current_node = current_node.next
      end
      return current_node.data        
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    def find_nth_from_end(n)
      return nil if n > self.length - 1
      main_walker = @head
      secondary_walker = @head
      main_walker_counter = 0
      until main_walker_counter == n
        main_walker = main_walker.next
        main_walker_counter += 1
      end
      until main_walker.next == nil
        main_walker = main_walker.next
        secondary_walker = secondary_walker.next
      end
      return secondary_walker.data
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    def has_cycle
      raise NotImplementedError
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    def get_first
      return nil if @head.nil?
      return @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    def add_last(value)
      if @head.nil?
        add_first(value)
      else
        checking_node = @head
        until checking_node.next.nil?
          checking_node = checking_node.next
        end
        checking_node.next = Node.new(value)
      end
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    def get_last
      if @head.nil?
        return nil
      else
        checking_node = @head
        until checking_node.next.nil?
          checking_node = checking_node.next
        end
      end
      return checking_node.data
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    def insert_ascending(value)
      raise NotImplementedError
    end

    # Helper method for tests
    # Creates a cycle in the linked list for testing purposes
    # Assumes the linked list has at least one node
    def create_cycle
      return if @head == nil # don't do anything if the linked list is empty

      # navigate to last node
      current = @head
      while current.next != nil
          current = current.next
      end

      current.next = @head # make the last node link to first node
    end
end
