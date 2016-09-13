support
cacheMakesSense: node
	| theNode |
	theNode := node.
	theNode class == PP2DelegateNode ifTrue: [ theNode := theNode child ].
	"trimmers are already optimized, I care about the body"
	theNode isTrimming ifTrue: [ theNode := theNode child ].
	
	^ (theNode propertyAt: #allNodesSize ifAbsentPut: [ theNode allNodes size ]) > 2