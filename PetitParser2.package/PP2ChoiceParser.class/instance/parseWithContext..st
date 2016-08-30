parsing - private
parseWithContext: aPP2Context
	"This is optimized code that avoids unnecessary block activations, do not change. When all choices fail, the last failure is answered."

	| context |
	1 to: children size do: [ :index |
		context := (children at: index)
			parseWithContext: aPP2Context.
		context isPetit2Failure
			ifFalse: [ ^ context ] ].
	^ context