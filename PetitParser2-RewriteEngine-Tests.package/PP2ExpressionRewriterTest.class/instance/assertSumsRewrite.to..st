parsing
assertSumsRewrite: input to: output
	result := (self parserClass new rewriteSums: input).
	self assert: result equals: output