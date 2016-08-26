private
build: aNode assignment: anArray
	^ anArray isEmpty
		ifTrue: [ aNode ]
		ifFalse: [
			anArray reverse 
				inject: aNode
				into: [ :result :each |
					RBAssignmentNode 
						variable: each first
						value: result
						position: each second start ] ]