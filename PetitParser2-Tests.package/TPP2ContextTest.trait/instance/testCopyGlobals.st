tests
testCopyGlobals
	| context contextCopy |
	context := self contextOn: 'foo'.
	context globals: (IdentityDictionary newFromPairs: { #a . #b }).
	
	contextCopy := context copy.
	
	self assert: context globals equals: contextCopy globals.
	self assert: context globals ~~ contextCopy globals.
	