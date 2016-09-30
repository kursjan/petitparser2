accessing
testAction
	| action |
	parser := $a asPParser.
	action := parser ==> [:e | e].
	
	self nextSet: parser in: action.

	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.
	
	self nextSet: action in: action.
	self assert: nextSet size equals: 1.
	self assert: nextSet includes: eoi.