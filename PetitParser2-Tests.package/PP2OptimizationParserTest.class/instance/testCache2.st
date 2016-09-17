tests
testCache2
	| parser context result |
	parser := $a asPParser star.
	parser strategy: parser strategy cache.
	parser setOptimized.
	
	context := 'aaa' asPetit2Context.

	result := parser parseAdaptableWithContext: context.
	self assert: result position equals: 3.
	
	context := 'aabb' asPetit2Context.

	result := parser parseAdaptableWithContext: context.
	self assert: result position equals: 2.