support
cacheMakesSense: node
	| parser |
	parser := node.
	parser class == PP2DelegateNode ifTrue: [ parser := parser child ].
	"trimmers are already optimized, I care about the body"
	parser isTrimming ifTrue: [ parser := parser child ].
	^ parser allNodes size > 2