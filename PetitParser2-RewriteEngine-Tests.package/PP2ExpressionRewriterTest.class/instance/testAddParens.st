testing - rewrite
testAddParens
	| pattern |
	pattern := self patternFrom: '`a` `op{beToken}` `b`' to: '`(a)` `op` `(b)`'.
	
	self assert: '1+1+1' isRewrittenTo: '(1) + ((1) + (1))' using: pattern