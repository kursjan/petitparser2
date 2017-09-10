parsing
assert: input isRewrittenTo: output using: pattern
	result := self parserClass new rewrite: input with: pattern.
	self assert: result equals: output