comparing
= anotherContext
	super = anotherContext ifFalse: [ ^ false ].
	
	(self currentNext size = anotherContext currentNext size) ifFalse: [ ^ false ].
	self currentNext do: [ :value |
		(anotherContext currentNext includes: value) ifFalse: [ ^ false ]
	].

	^ true