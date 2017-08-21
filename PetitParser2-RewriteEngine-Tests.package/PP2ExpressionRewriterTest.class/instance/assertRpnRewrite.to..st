parsing
assertRpnRewrite: input to: output
	result := (self parserClass new rewriteRpn: input).
	self assert: result equals: output