class WeightedQuickUnion

	def initialize()
		@nodes = {}
		@sizes = {}
	end

	def connected?(first_node, second_node)
		root(first_node) == root(second_node)
	end

	def union(first_node, second_node)
		[first_node, second_node].each do |node|
			raise "Invalid node" if node.nil?
			unless @nodes[node]
				@nodes[node] = node
				@sizes[node] = 1
			end
		end

		i = root(first_node)
		j = root(second_node)

		return if i == j

		if @sizes[i] < @sizes[j]
			@nodes[i] = j
			@sizes[j] += @sizes[i]
		else
			@nodes[j] = i
			@sizes[i] += @sizes[j]
		end
	end

	def roots
		@nodes.keys.select { |x| @nodes[x] == x }
	end

	def root(index)
		return index unless @nodes[index]

		while index != @nodes[index]
			index = @nodes[index]
		end

		index
	end
end
