tests
testCache
	| counter parser contextOne contextTwo |
	counter := 0.

	parser := [ :ctx | counter := counter + 1. #foo ] asParser2.
	parser strategy: parser strategy cache.

	contextOne := 'foo' asPetit2Context.
	contextTwo := 'bar' asPetit2Context.
	
	parser parseAdaptableWithContext: contextOne.
	self assert: counter equals: 1.
	
	parser parseAdaptableWithContext: contextOne.
	self assert: counter equals: 1.
	
	contextOne next.
	parser parseAdaptableWithContext: contextOne.
	self assert: counter equals: 2.

	parser parseAdaptableWithContext: contextTwo.
	self assert: counter equals: 3.

	