modifications
setPosition: newPosition
	"answers a copy of the context that has an updated return value"
	^ self copy 
		position: newPosition;
		yourself
