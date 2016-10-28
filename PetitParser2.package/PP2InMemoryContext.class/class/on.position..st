instance creation
on: aCollection position: position
	^ (self on: aCollection) 
		position: position;
		setAsStartState;
		yourself.
