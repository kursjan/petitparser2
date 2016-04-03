utilities
assert: aParser parse: aCollection toTokenValue: value end: end
	| result |
	result := self
		assert: aParser
		parse: aCollection
		to: nil
		end: end.
	self assert: (result value isKindOf: PP2Token).
	self assert: result value value equals: value.
	^ result