private
event: value
	positions addLast: self position.
	selectors addLast: self selector.
	strategies addLast: self strategy.
	events addLast: value.