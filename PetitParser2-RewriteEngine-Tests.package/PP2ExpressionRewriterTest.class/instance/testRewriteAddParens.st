testing - rewrite
testRewriteAddParens
	| pattern |
	pattern := self patternFrom: '`a` `op` `b`' to: '`(a)` `op` `(b)`'.
	
	self assert: '1+(1+1)' isRewrittenTo: '(1) + ((1) + (1))' using: pattern