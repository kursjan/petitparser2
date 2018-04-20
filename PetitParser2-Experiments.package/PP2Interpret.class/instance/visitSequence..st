visiting
visitSequence: parser
	| retval elements memento |

	memento := currentContext remember.
	elements := Array new: parser children size.
	
	1 to: elements size do: [ :index |
		retval := self visit: (parser childAt: index).
		retval isPetit2Failure ifTrue: [ 
			currentContext restore: memento. 
			^ retval
		].
		elements at: index put: retval 
	].
	
	^ elements