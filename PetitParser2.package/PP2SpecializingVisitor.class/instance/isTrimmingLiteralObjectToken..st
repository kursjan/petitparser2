testing
isTrimmingLiteralObjectToken: node 
	| child |
	self assert: (node isKindOf: PP2TrimmingTokenNode ).
	child := node child.
	child isJustDelegate ifTrue: [ child := child child ].
	
	^ (child isKindOf: PP2LiteralObjectNode) 