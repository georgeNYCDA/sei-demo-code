class Queue
	def initialize
		@queue = []
	end

	def enqueue(num)
		@queue << num
	end

	def dequeue
		@queue.shift
	end

	def empty?
		@queue.empty?
	end
end