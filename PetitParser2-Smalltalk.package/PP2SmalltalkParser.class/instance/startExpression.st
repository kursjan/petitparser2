accessing
startExpression
	"Make the sequence node has a method node as its parent and that the source is set."

	^ ([ :stream | stream collection ] asParser and , super startExpression) map: [ :source :node | 
		(RBMethodNode selector: #doIt body: node)
			source: source.
		(node statements size = 1 and: [ node temporaries isEmpty ])
			ifTrue: [ node statements first ]
			ifFalse: [ node ] ]