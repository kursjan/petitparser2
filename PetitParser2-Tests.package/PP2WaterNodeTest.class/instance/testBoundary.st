as yet unclassified
testBoundary
	| water boundary |
	water := PP2WaterNode new.
	boundary := $a asPParser.
	
	water boundary: boundary.
	
	self assert: (water boundary isKindOf: PP2AndNode).
	self assert: water boundary child == boundary