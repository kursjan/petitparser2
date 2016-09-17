as yet unclassified
testBypassCache

	| cache |
	cache := $a asPParser wrapped.
	cache strategy: cache strategy cache.
	
	parser := cache plus.
	parser strategy: (PP2Plus on: parser).
	
	self visit: parser.
	
	self assert: parser strategy child isKindOf: PP2DelegateNode.