tests
testListReplace
	| one other another list |
	one := $a asParser.
	other := $b asParser.
	another := $c asParser.
	list := one , another , one.
	self assert: list children first == one.
	self assert: list children second == another.
	self assert: list children last == one.
	
	list replace: other with: one.
	self assert: list children first == one.
	self assert: list children second == another.
	self assert: list children last == one.
	
	list replace: one with: other.
	self assert: list children first == other.
	self assert: list children second == another.
	self assert: list children last == other.
	
	list replace: another with: one.
	self assert: list children first == other.
	self assert: list children second == one.
	self assert: list children last == other