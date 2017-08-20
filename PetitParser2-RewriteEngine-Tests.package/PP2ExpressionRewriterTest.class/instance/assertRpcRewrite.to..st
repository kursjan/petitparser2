parsing
assertRpcRewrite: input to: output
	result := (self parserClass new rewrite: input).
	self assert: result equals: output