private
event: value
	positions addLast: self position.
	selectors addLast: self selector.
	Halt if: [ self strategy isNil ].
	strategies addLast: self strategy.
	events addLast: value.