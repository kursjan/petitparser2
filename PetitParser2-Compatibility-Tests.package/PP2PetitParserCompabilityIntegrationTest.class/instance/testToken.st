as yet unclassified
testToken
	| parser result |
	parser := 'foo' asParser token asPetit2Parser.
	
	result := (self assert: parser parse: 'foo') value.
	self assert: (result isKindOf: PPToken).
	self assert: result inputValue equals: 'foo'.