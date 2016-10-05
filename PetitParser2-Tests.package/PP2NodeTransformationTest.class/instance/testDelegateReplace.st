tests
testDelegateReplace
	| one other delegate |
	one := $a asPParser.
	other := $b asPParser.
	
	delegate := one token.
	self assert: delegate children first == one.
	self deny: delegate children first == other.
	
	delegate replace: other with: one.
	self assert: delegate children first == one.
	self deny: delegate children first == other.
	
	delegate replace: one with: other.
	self deny: delegate children first == one.
	self assert: delegate children first == other