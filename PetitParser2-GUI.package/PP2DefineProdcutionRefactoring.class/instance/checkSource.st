private
checkSource
	| rewriter |
	method := RBParser
		parseMethod: source
		onError: [ :string :position | ^ false ].
	rewriter := self sourceRewriter.
	[ rewriter executeTree: method ]
		whileTrue: [ method := rewriter tree ].
	^ method selector isUnary