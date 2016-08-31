loop control
openedResultFor: node
	"
		JK: I am not sure, but this should never happen. If this happens, the grammar 
			 contains an infinite loop.
			
			If you think I am wrong, you probably also know what to return (I don't).
	"
	self error: 'There seems to be a left recursive loop in your grammar!'