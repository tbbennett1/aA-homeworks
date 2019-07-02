#EXERCISE 1 -  Stack
  class Stack
    def initialize  
      @stack = []       # create ivar to store stack here!
    end

    def push(el)
      @stack.push(el)   # adds an element to the stack
    end

    def pop
      @stack.pop        # removes one element from the stack
    end

    def peek
      @stack.last       # returns, but doesn't remove, the top element in the stack
    end
  end

# stack = Stack.new
# stack.push(5)
# stack.push("hello")
# stack.peek          #hello
# stack.push("something")
# stack.peek          #something
# stack.pop
# stack.pop
# stack.peek          #5


#EXERCISE 2 - Queue
class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def peek
    puts @queue.last
  end
end

# queue = Queue.new
# queue.enqueue('brock')
# queue.enqueue('britt')
# queue.enqueue('coop')
# queue.peek          #brock
# queue.dequeue
# queue.peek          #britt
# queue.dequeue       
# queue.peek          #coop


#EXERCISE 3 - Map
class Map
  def initialize
    @map = []
  end

  def set(key, value)
    if @map.any? {|sets| sets[0] == key}
      @map.each {|sets| sets << value if sets[0] == key }
    else  
      @map << [key, value]
    end  
  end

  def get(key)
    @map.select {|set| set[0] == key}
  end

  def delete(key)
    @map = @map.reject {|set| set[0] == key}
  end

  def show
    p @map
  end
end

# map = Map.new
# map.set("k1", 1)
# map.set("k2", 2)
# map.set("k3", 3)
# map.show          #[["k1", 1], ["k2", 2], ["k3", 3]]
# map.set("k2", 4)
# map.show          #[["k1", 1], ["k2", 2, 4], ["k3", 3]]
# p map.get("k2")   #[["k2", 2, 4]]
# map.delete("k2")
# map.show          #[["k1", 1], ["k3", 3]]




