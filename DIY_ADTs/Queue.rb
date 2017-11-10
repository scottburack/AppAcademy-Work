class Queue

   def initialize
     @queue = queue
   end

   def enqueue(el)
    queue.unshift(el)
   end

   def dequeue
     queue.pop
   end

   def queue
     @queue
   end

end
