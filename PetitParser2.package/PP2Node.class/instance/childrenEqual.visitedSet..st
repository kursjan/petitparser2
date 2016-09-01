comparing
childrenEqual: anotherNode visitedSet: visitedSet
	"
		Invokes the comparison function on all children, while passing the visited
		set to avoid infinite loops.
	"
	self children size = anotherNode children size ifFalse: [ ^ false ].
	
	self children with: anotherNode children do: [ :child :anotherChild |
		(child equals: anotherChild visitedSet: visitedSet) ifFalse: [ ^ false ]
	].
	^ true