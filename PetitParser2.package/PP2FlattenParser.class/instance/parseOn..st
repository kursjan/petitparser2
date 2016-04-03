parsing - private
parseOn: aPP2Context
	| context |

	context := parser parseWithContext:  aPP2Context.
	context isPetit2Failure ifTrue: [ ^ context ].
	
	^ context copyFrom: (aPP2Context position) to: context position - 1
