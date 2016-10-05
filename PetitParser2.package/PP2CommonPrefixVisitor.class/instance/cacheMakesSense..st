support
cacheMakesSense: production
	| node target |
	node := production isJustDelegate ifTrue: [ production child ] ifFalse: [ production ].

	target := node.
	"trimmers are already optimized, I care about the body"
	node isTrimming ifTrue: [ target := node child ].
	node isTrimmingToken ifTrue: [ target := node child child ].
	
	^ (target propertyAt: #allNodesSize ifAbsentPut: [ node allNodes size ]) > 2