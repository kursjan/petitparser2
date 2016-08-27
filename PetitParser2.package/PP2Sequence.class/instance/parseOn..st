parsing
parseOn: aPP2Context
	| retval elements memento |

	memento := aPP2Context remember.
	elements := Array new: node children size.
	
	1 to: elements size do: [ :index |
		retval := (node childAt: index) parseOn: aPP2Context.
		retval isPetit2Failure ifTrue: [ 
			aPP2Context restore: memento. 
			^ retval
		].
		elements at: index put: retval 
	].
	
	^ elements