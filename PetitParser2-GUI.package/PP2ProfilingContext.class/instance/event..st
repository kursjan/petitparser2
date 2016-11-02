private
event: value
	positions addLast: self position.
	nodes addLast: self node.
	strategies addLast: self strategy.
	events addLast: value.