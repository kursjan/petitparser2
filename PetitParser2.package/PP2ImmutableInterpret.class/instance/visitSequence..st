visiting
visitSequence: parser
	| elements |

	elements := Array new: parser children size.
	1 to: elements size do: [ :index |
		self visit: (parser childAt: index).
		currentContext isPetit2Failure ifTrue: [ ^ currentContext ].
		elements at: index put: currentContext value ].
	
	^ currentContext retval: elements