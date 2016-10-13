instance creation
on: aCollection position: position
	^ (self on: aCollection) 
		position: position;
		startMemento: position;
		yourself