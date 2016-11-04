comparison
= anotherMemento
	self class == anotherMemento class ifFalse: [ ^ false ].
	
	self position == anotherMemento position ifFalse: [ ^ false ].
	self stream == anotherMemento stream ifFalse: [ ^ false ].
	
	^ self properties = anotherMemento properties